
class Payment < ApplicationRecord
  belongs_to :lease_snapshot
  
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_date, presence: true
  validates :mode, presence: true, inclusion: { in: %w[cash upi bank_transfer] }
  
  scope :recent, -> { order(payment_date: :desc) }
  scope :by_mode, ->(mode) { where(mode: mode) }
  scope :in_date_range, ->(start_date, end_date) { where(payment_date: start_date..end_date) }
  
  def mode_display
    mode.humanize
  end
end