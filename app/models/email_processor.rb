class EmailProcessor
  def initialize(email)
    puts 'give me something'
    @email = email
  end

  def process
    Shoe.create!({sku: 'EmailParse', size: '10', quantity: 3, price: 100, user_id: 1})
  end
end
