
class LeaseSnapshot < ApplicationRecord
  belongs_to :land
  belongs_to :farmer, class_name: 'Person'
  has_many :payments, dependent: :destroy
  
  validates :financial_year, presence: true
  validates :investment_amount, presence: true, numericality: { greater_than: 0 }
  validates :expected_return, presence: true, numericality: { greater_than: 0 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[active completed cancelled] }
  
  validate :end_date_after_start_date
  validate :unique_land_per_financial_year
  
  scope :active, -> { where(status: 'active') }
  scope :for_financial_year, ->(year) { where(financial_year: year) }
  scope :by_farmer, ->(farmer_id) { where(farmer_id: farmer_id) }
  
  def total_payments
    payments.sum(:amount)
  end
  
  def outstanding_amount
    expected_return - total_payments
  end
  
  def payment_percentage
    return 0 if expected_return.zero?
    (total_payments / expected_return * 100).round(2)
  end
  
  def is_fully_paid?
    outstanding_amount <= 0
  end
  
  def profit
    expected_return - investment_amount
  end
  
  def profit_percentage
    return 0 if investment_amount.zero?
    (profit / investment_amount * 100).round(2)
  end
  
  private
  
  def end_date_after_start_date
    return unless start_date && end_date
    errors.add(:end_date, "must be after start date") if end_date <= start_date
  end
  
  def unique_land_per_financial_year
    existing = LeaseSnapshot.where(
      land_id: land_id,
      financial_year: financial_year
    ).where.not(id: id)
    
    if existing.exists?
      errors.add(:financial_year, "already has a lease for this land")
    end
  end
end
