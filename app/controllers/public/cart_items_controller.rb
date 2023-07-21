class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItrem.new(cart_item_params)
  end
  
  def update
  end
  
  def destroy
  end
  
  def all_destroy
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end
  
private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :price)
  end
end
