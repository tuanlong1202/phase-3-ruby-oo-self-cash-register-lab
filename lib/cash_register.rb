class CashRegister
    
    attr_accessor :total, :discount
    attr_writer :items_list

    def initialize(discount=0)
        @total = 0.0
        @discount = discount
        @items_list = []
    end

    def total=(amount)
        @total = amount
    end

    def total
        @total
    end

    def discount
        @discount
    end

    def items_list=(item)
        @items_list << item
    end

    def add_item(title,price,quantity = 1)
        iCount = 0
        item = [3]
        item[0] = title
        item[1] = price
        item[2] = quantity
        self.items_list = item
        self.total += price*quantity
    end

    def apply_discount
        strRet = ""
        if self.discount > 0
            self.total = self.total*(1 - (self.discount.to_f/100))
            strRet =  "After the discount, the total comes to $#{self.total.to_i}."
        else
            strRet = "There is no discount to apply."
        end
        strRet
    end

    def items
        arrRet = []
        @items_list.each do |item|
            iCount = 0
            while iCount < item[2] do
                arrRet << item[0]
                iCount += 1
            end
        end
        arrRet
    end

    def void_last_transaction
        @items_list.pop
        self.total = 0.0
        @items_list.each do |item|
            self.total += item[1]*item[2]
        end
    end

end