class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id], is_active: true)
    else
      @items = Item.where(is_active: true)
    end

    if params[:search].present?
      @items = @items.where('name LIKE ?', "%#{params[:search]}%")
    end
  end

  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
  
  def item_params
    params.require(:items).permit(:image,:name,:description,:price, :genre_id)
  end
end