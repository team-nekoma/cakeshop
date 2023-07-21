class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items.all
    # @cart_item = CartItem.new(cart_item_params)
  end
  
  # def update
  # end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to public_cart_items_path, notice: "数量の変更を保存しました"
    else
      redirect_to request.referer, alert: "正しい数字を入力してください"
    end
    if @cart_item.amount == 0
      @cart_item.destroy
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "商品の削除に成功しました"
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.all_destroy
    redirect_to public_cart_items_path, notice: "カート内を空にしました"
  end
  
 def create
  @cart_item = current_customer.cart_items.new(cart_item_params)
  if @cart_item.save
    puts "Save successful!"
    redirect_to cart_items_path
  else
    puts @cart_item.errors.full_messages
  end
 end


  
private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end
end