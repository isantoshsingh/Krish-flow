class ReportsController < ApplicationController
  def index
    @financial_years = LeaseSnapshot.distinct.pluck(:financial_year).sort.reverse
    @selected_fy = params[:financial_year] || current_financial_year
    
    @lease_snapshots = LeaseSnapshot.for_financial_year(@selected_fy)
                                   .includes(:land, :farmer, :payments)
    
    @summary = {
      total_investment: @lease_snapshots.sum(:investment_amount),
      expected_returns: @lease_snapshots.sum(:expected_return),
      received_payments: @lease_snapshots.joins(:payments).sum('payments.amount'),
      outstanding_amount: @lease_snapshots.sum(:expected_return) - 
                         @lease_snapshots.joins(:payments).sum('payments.amount')
    }
  end
  
  def export
    @financial_year = params[:financial_year] || current_financial_year
    @lease_snapshots = LeaseSnapshot.for_financial_year(@financial_year)
                                   .includes(:land, :farmer, :payments)
    
    respond_to do |format|
      format.csv { send_csv_report }
      format.pdf { send_pdf_report }
    end
  end
  
  private
  
  def send_csv_report
    csv_data = generate_csv_report
    send_data csv_data, 
              filename: "krishflow_report_#{@financial_year}.csv",
              type: 'text/csv'
  end
  
  def send_pdf_report
    pdf_data = generate_pdf_report
    send_data pdf_data,
              filename: "krishflow_report_#{@financial_year}.pdf",
              type: 'application/pdf'
  end
  
  def generate_csv_report
    CSV.generate(headers: true) do |csv|
      csv << ['Land Location', 'Land Size', 'Landowner', 'Farmer', 'Investment', 
              'Expected Return', 'Payments Received', 'Outstanding']
      
      @lease_snapshots.each do |lease|
        csv << [
          lease.land.location,
          lease.land.display_size,
          lease.land.landowner.name,
          lease.farmer.name,
          lease.investment_amount,
          lease.expected_return,
          lease.total_payments,
          lease.outstanding_amount
        ]
      end
    end
  end
  
  def generate_pdf_report
    Prawn::Document.new do |pdf|
      pdf.text "KrishFlow Report - #{@financial_year}", size: 20, style: :bold
      pdf.move_down 20
      
      # Summary table
      pdf.text "Summary", size: 16, style: :bold
      summary_data = [
        ['Total Investment', "₹#{@lease_snapshots.sum(:investment_amount)}"],
        ['Expected Returns', "₹#{@lease_snapshots.sum(:expected_return)}"],
        ['Received Payments', "₹#{@lease_snapshots.joins(:payments).sum('payments.amount')}"],
        ['Outstanding', "₹#{@lease_snapshots.sum(:expected_return) - @lease_snapshots.joins(:payments).sum('payments.amount')}"]
      ]
      
      pdf.table(summary_data, header: false, width: pdf.bounds.width) do
        style(row(0..-1), padding: [5, 10])
        style(column(0), font_style: :bold)
      end
      
      pdf.move_down 30
      
      # Detailed lease data
      pdf.text "Lease Details", size: 16, style: :bold
      pdf.move_down 10
      
      lease_data = [['Land', 'Farmer', 'Investment', 'Expected', 'Received', 'Outstanding']]
      @lease_snapshots.each do |lease|
        lease_data << [
          lease.land.location,
          lease.farmer.name,
          "₹#{lease.investment_amount}",
          "₹#{lease.expected_return}",
          "₹#{lease.total_payments}",
          "₹#{lease.outstanding_amount}"
        ]
      end
      
      pdf.table(lease_data, header: true, width: pdf.bounds.width) do
        style(row(0), font_style: :bold, background_color: 'E5E5E5')
        style(row(1..-1), padding: [3, 5])
      end
    end.render
  end
end