class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machinesnacks
  has_many :snacks, through: :machinesnacks

  def average_snack_price
    snacks.average(:price)
  end

  def total_items_count
    snacks.count
  end
end
