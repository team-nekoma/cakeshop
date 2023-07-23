class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
   
   before_action :authenticate_admin!
   
  def index
      @orders = Order.all
  end
  
  def update_status
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to admin_orders_path
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      redirect_to admin_orders_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
