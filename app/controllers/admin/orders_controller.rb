class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
   
  def show
    @order = Order.find(params[:id])
    @order_datails = @order.order_datails
  end
  
  def update_status
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to admin_path
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      redirect_to admins_path
    end
  end

  private

  def order_params
   params.require(:order).permit(:order_status)
  end
end
