class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_datails = @order.order_datails
  end

  def update_status
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @order.order_datails.update_all(production_status: "in_production") if @order.order_status == "in_production"
      @order.order_datails.update_all(production_status: "production_pending") if @order.order_status == "payment_confirmed"
      @order.order_datails.update_all(production_status: "production_not_possible") if @order.order_status == "waiting_for_payment"
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to admin_path
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      redirect_to admins_path
    end
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(production_status: "production_pending") if @order.order_status == "payment_confirmed"
    end
    redirect_to admin_order_path(@order)
  end


  private

  def order_params
   params.require(:order).permit(:order_status)
  end
end
