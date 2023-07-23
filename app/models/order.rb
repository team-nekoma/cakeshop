class Order < ApplicationRecord
   belongs_to :customer
   
   
   enum payment: { credit_card: 0, transfer: 1}
   # enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済:4}
    

  #   enum status: {
  #   unpaid: 0,
  #   payment_confirmed: 1,
  #   in_production: 2,
  #   preparing_for_shipment: 3,
  #   shipped: 4
  # }
    
  #   enum status: {
  #   unpaid: 0,
  #   payment_confirmed: 1,
  #   in_production: 2,
  #   preparing_for_shipment: 3,
  #   shipped: 4
  # }
end
