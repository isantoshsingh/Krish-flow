
class Person < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :village, presence: true
  validates :district, presence: true
  
  has_many :owned_lands, class_name: 'Land', foreign_key: 'landowner_id', dependent: :destroy
  has_many :lease_snapshots, foreign_key: 'farmer_id', dependent: :destroy
  
  scope :landowners, -> { joins(:owned_lands).distinct }
  scope :farmers, -> { joins(:lease_snapshots).distinct }
  
  def full_address
    "#{village}, #{district}"
  end
  
  def total_owned_land_size
    owned_lands.sum(:size_in_biswas)
  end
  
  def total_farmed_land_size
    lease_snapshots.joins(:land).sum(:size_in_biswas)
  end
  
  def is_landowner?
    owned_lands.any?
  end
  
  def is_farmer?
    lease_snapshots.any?
  end
end