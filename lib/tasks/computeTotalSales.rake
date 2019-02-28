
task :initiateSales => :environment do
  for i in User.pluck(:id)
    countPrice = 0
    for j in Shoe.where(user_id: i, sold: true).pluck(:price)
      countPrice = countPrice + j
    end
    user1 = User.where(:id => i, :).first
    user1.update_column(:sold,countPrice.to_f)
  end
end
