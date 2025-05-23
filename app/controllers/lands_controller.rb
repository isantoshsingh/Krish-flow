class LandsController < ApplicationController
  before_action :set_land, only: [:show, :edit, :update, :destroy]
  
  def index
    @lands = Land.includes(:landowner)
    @lands = @lands.by_location(params[:search]) if params[:search].present?
    @lands = @lands.by_landowner(params[:landowner_id]) if params[:landowner_id].present?
    @landowners = Person.landowners
  end
  
  def show
    @current_lease = @land.current_lease_snapshot
    @lease_history = @land.lease_snapshots.includes(:farmer, :payments).order(:financial_year)
  end
  
  def new
    @land = Land.new
    @landowners = Person.all
  end
  
  def create
    @land = Land.new(land_params)
    
    if @land.save
      redirect_to @land, notice: 'Land was successfully created.'
    else
      @landowners = Person.all
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @landowners = Person.all
  end
  
  def update
    if @land.update(land_params)
      redirect_to @land, notice: 'Land was successfully updated.'
    else
      @landowners = Person.all
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @land.destroy
    redirect_to lands_url, notice: 'Land was successfully deleted.'
  end
  
  private
  
  def set_land
    @land = Land.find(params[:id])
  end
  
  def land_params
    params.require(:land).permit(:location, :size_value, :size_unit, :landowner_id)
  end
end