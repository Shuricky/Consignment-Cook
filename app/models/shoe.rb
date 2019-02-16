class Shoe < ApplicationRecord

  belongs_to :user
  validates :sku, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates :size, presence: true


  def self.to_csv(options = {})
    CSV.generate do |csv_file|
      csv_file << csv_header_row
      Shoe.all.each_with_index do |sneaker,index|
        csv_file << [sneaker.sku, sneaker.size, 1,  sneaker.price]
      end
    end
  end

  def self.csv_header_row
    %w(Style_Number Size Quantity Price)
  end
end
