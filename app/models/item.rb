class Item < ApplicationRecord

 def price_including_tax
  (price * 1.1).floor  # 税率を10%として計算して切り捨て
 end

  has_one_attached :image
  enum status: { on_sale: 0, off_sale: 1 }
  
   def human_enum_name(enum_name)
    I18n.t("enums.#{self.class.name.downcase}.#{enum_name.to_s}.#{public_send(enum_name)}")
   end
  
  has_many :cart_items
  has_many :genres
  has_many :order_datails
  validates :price, presence: true
end
