class Shoe < ApplicationRecord

  require 'csv'
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

  def self.import(file,userId)
		CSV.foreach(file.path, :headers => true) do |row|
      Rails.logger.debug row['style number']
      Rails.logger.debug row['size']
      Rails.logger.debug row['quantity']
      Rails.logger.debug row['price']
      for i in 1..row['quantity']
				Shoe.create!(sku: row['style number'] , quantity: 1, size: row['size'], price: row['price'], user_id: userId, sold: false)
      end
		end
	end

end
