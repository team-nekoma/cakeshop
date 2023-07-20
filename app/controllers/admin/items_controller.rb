class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

end
