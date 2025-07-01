class DashboardController < ApplicationController
  def index
    @current_fy = current_financial_year
    @stats = calculate_dashboard_stats
    @recent_payments = Payment.includes(lease_snapshot: [:land, :farmer])
                             .recent.limit(10)
    @active_leases = LeaseSnapshot.active
                                 .for_financial_year(@current_fy)
                                 .includes(:land, :farmer)
                                 .limit(10)
  end
  
  private
  
  def calculate_dashboard_stats
    current_leases = LeaseSnapshot.active.for_financial_year(@current_fy)
    
    {
      total_lands: Land.count,
      leased_lands: current_leases.count,
      total_investment: current_leases.sum(:investment_amount),
      expected_returns: current_leases.sum(:expected_return),
      received_payments: current_leases.joins(:payments).sum('payments.amount'),
      outstanding_amount: current_leases.sum(:expected_return) - 
                         current_leases.joins(:payments).sum('payments.amount'),
      total_farmers: Person.farmers.count,
      total_landowners: Person.landowners.count
    }
  end
end