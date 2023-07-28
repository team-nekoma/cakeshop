class Customer < ApplicationRecord

  has_many :addresses
   has_many :orders
   has_many :cart_items, dependent: :destroy
   validates :last_name, presence:true
   validates :first_name, presence:true
   validates :kana_last_name, presence:true
   validates :kana_first_name, presence:true
   validates :phone_number, presence:true
   validates :post_code, length: { is: 7 }
   validates :address, presence:true
   validates :email, presence:true
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
