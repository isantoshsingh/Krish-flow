class LeaseSnapshotsController < ApplicationController
  before_action :set_land, except: [:index, :show]
  before_action :set_lease_snapshot, only: [:show, :edit, :update, :destroy]
  
  def index
    @lease_snapshots = LeaseSnapshot.includes(:land, :farmer)
    @lease_snapshots = @lease_snapshots.for_financial_year(params[:financial_year]) if params[:financial_year].present?
    @lease_snapshots = @lease_snapshots.by_farmer(params[:farmer_id]) if params[:farmer_id].present?
    @financial_years = LeaseSnapshot.distinct.pluck(:financial_year).sort.reverse
    @farmers = Person.farmers
  end
  
  def show
    @payments = @lease_snapshot.payments.recent
  end
  
  def new
    @lease_snapshot = @land.lease_snapshots.build
    @lease_snapshot.financial_year = current_financial_year
    @farmers = Person.all
  end
  
  def create
    @lease_snapshot = @land.lease_snapshots.build(lease_snapshot_params)
    
    if @lease_snapshot.save
      redirect_to [@land, @lease_snapshot], notice: 'Lease was successfully created.'
    else
      @farmers = Person.all
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @farmers = Person.all
  end
  
  def update
    if @lease_snapshot.update(lease_snapshot_params)
      redirect_to [@land, @lease_snapshot], notice: 'Lease was successfully updated.'
    else
      @farmers = Person.all
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @lease_snapshot.destroy
    redirect_to @land, notice: 'Lease was successfully deleted.'
  end
  
  private
  
  def set_land
    @land = Land.find(params[:land_id]) if params[:land_id]
  end
  
  def set_lease_snapshot
    if @land
      @lease_snapshot = @land.lease_snapshots.find(params[:id])
    else
      @lease_snapshot = LeaseSnapshot.find(params[:id])
      @land = @lease_snapshot.land
    end
  end
  
  def lease_snapshot_params
    params.require(:lease_snapshot).permit(:farmer_id, :financial_year, :investment_amount, 
                                          :expected_return, :start_date, :end_date, :status)
  end
end