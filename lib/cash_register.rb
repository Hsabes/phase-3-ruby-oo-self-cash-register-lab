require 'pry'

class CashRegister

    attr_accessor :total, :discount, :price, :add_item, :title, :items, :quantity
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity
        @total += (price * quantity)
        @items = @items.fill(@title, @items.length, quantity)
        @void_last_transaction = price
    end

    def apply_discount
        if (@discount > 0)
            @total = (@price - (@price * (@discount.to_f / 100.00))).to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @void_last_transaction
        @total = @total - (@void_last_transaction * @quantity)
    end

end

harry = CashRegister.new
binding.pry