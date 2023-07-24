class OrderDatail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    
    def buy_price
      item.price_including_tax * quantity 
    end
    
end
