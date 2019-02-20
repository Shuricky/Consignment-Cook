require 'csv'

task :import_data => :environment do
  CSV.foreach('listings_report.csv') do |row|
    puts row[4]
    puts row[5]
    puts row[6]
    puts row[0]
    shoe = Shoe.new(
      :sku => row[4],
      :size => row[5],
      :quantity => 1,
      :price => row[6],
      :user_id => 1,
      :stockId => row[0]
    )
    shoe.save!
  end
end
