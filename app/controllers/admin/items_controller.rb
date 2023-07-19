class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path, notice: '商品が更新されました'
    else
      render :edit
    end
  end


  private

    def item_params
      params.require(:item).permit(:name, :description, :price, :status, :image)
    end
end
