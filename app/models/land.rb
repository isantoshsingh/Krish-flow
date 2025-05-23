class Land < ApplicationRecord
  belongs_to :landowner, class_name: 'Person'
  has_many :lease_snapshots, dependent: :destroy
  has_many :farmers, through: :lease_snapshots, source: :farmer
  
  validates :location, presence: true
  validates :size_value, presence: true, numericality: { greater_than: 0 }
  validates :size_unit, presence: true, inclusion: { in: %w[bigha biswa] }
  validates :size_in_biswas, presence: true, numericality: { greater_than: 0 }
  
  before_validation :calculate_size_in_biswas
  
  scope :by_location, ->(location) { where("location ILIKE ?", "%#{location}%") }
  scope :by_landowner, ->(landowner_id) { where(landowner_id: landowner_id) }
  
  def display_size
    if size_unit == 'bigha'
      "#{size_value} bigha"
    else
      "#{size_value} biswa"
    end
  end
  
  def current_lease_snapshot(financial_year = current_financial_year)
    lease_snapshots.find_by(financial_year: financial_year)
  end
  
  def is_leased?(financial_year = current_financial_year)
    current_lease_snapshot(financial_year).present?
  end
  
  def total_investment(financial_year = current_financial_year)
    snapshot = current_lease_snapshot(financial_year)
    snapshot&.investment_amount || 0
  end
  
  def total_expected_return(financial_year = current_financial_year)
    snapshot = current_lease_snapshot(financial_year)
    snapshot&.expected_return || 0
  end
  
  private
  
  def calculate_size_in_biswas
    case size_unit
    when 'bigha'
      self.size_in_biswas = size_value * 20
    when 'biswa'
      self.size_in_biswas = size_value
    end
  end
  
  def current_financial_year
    today = Date.current
    if today.month >= 4
      "#{today.year}-#{today.year + 1}"
    else
      "#{today.year - 1}-#{today.year}"
    end
  end
end