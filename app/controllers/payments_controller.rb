class PaymentsController < ApplicationController
  before_action :set_lease_snapshot
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  
  def index
    @payments = @lease_snapshot.payments.recent
  end
  
  def show
  end
  
  def new
    @payment = @lease_snapshot.payments.build
    @payment.payment_date = Date.current
  end
  
  def create
    @payment = @lease_snapshot.payments.build(payment_params)
    
    if @payment.save
      redirect_to [@lease_snapshot.land, @lease_snapshot], notice: 'Payment was successfully recorded.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @payment.update(payment_params)
      redirect_to [@lease_snapshot.land, @lease_snapshot], notice: 'Payment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @payment.destroy
    redirect_to [@lease_snapshot.land, @lease_snapshot], notice: 'Payment was successfully deleted.'
  end
  
  private
  
  def set_lease_snapshot
    if params[:land_id]
      @lease_snapshot = Land.find(params[:land_id]).lease_snapshots.find(params[:lease_snapshot_id])
    else
      @lease_snapshot = LeaseSnapshot.find(params[:lease_snapshot_id])
    end
  end
  
  def set_payment
    @payment = @lease_snapshot.payments.find(params[:id])
  end
  
  def payment_params
    params.require(:payment).permit(:amount, :payment_date, :mode, :notes)
  end
end