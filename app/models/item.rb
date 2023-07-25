class Item < ApplicationRecord

 def price_including_tax
  (price * 1.1).floor  # 税率を10%として計算して切り捨て
 end

  has_one_attached :image
  
  has_many :cart_items
  has_many :genres
  has_many :order_datails
  validates :price, presence: true
end
