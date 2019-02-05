class EmailProcessor
  def self.process(email)
    Shoe.create!({sku: 'EmailParse', size: 10, quantity: 3, price: 100, user_id: 1})
  end
end
