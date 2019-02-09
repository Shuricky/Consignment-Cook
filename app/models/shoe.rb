class Shoe < ApplicationRecord

  belongs_to :user
  validates :sku, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates :size, presence: true


end
