class Item < ApplicationRecord
 def price_including_tax
  (price * 1.1).floor  # 税率を10%として計算して切り捨て
end

  has_one_attached :image
  enum status: { on_sale: 0, off_sale: 1 }
  
  has_many :cart_items
  validates :price, presence: true
end
