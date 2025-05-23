class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :lands_owned, :lands_farmed]
  
  def index
    @people = Person.all
    @people = @people.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    @people = @people.page(params[:page])
  end
  
  def show
  end
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(person_params)
    
    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully deleted.'
  end
  
  def lands_owned
    @lands = @person.owned_lands.includes(:lease_snapshots)
  end
  
  def lands_farmed
    @lease_snapshots = @person.lease_snapshots.includes(:land).recent
  end
  
  private
  
  def set_person
    @person = Person.find(params[:id])
  end
  
  def person_params
    params.require(:person).permit(:name, :phone, :village, :district)
  end
end