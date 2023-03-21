require "pry"

class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last_transaction = {
      title: nil,
      price: nil,
      quantity: nil,
    }
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)

    counter = quantity
    while counter > 0
      @items << title
      counter -= 1
    end

    @last_transaction = {
      :title => title,
      :price => price,
      :quantity => quantity,
    }
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      dif = (@discount / 100.0) * @total
      @total -= dif.to_i
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    # quantity = 3 
    quantity = self.last_transaction[:quantity]
    price = self.last_transaction[:price]
      # pop the last 3 items from the items array
      self.items.pop(quantity)
      # multiply price * quantity and subtract that from total
    @total -= quantity * price
    p @total
  end
end

gelt = CashRegister.new(10)
gelt.add_item("eggs", 1.99)
gelt.add_item("eggs", 1.99, 4)
gelt.void_last_transaction
# binding.pry
