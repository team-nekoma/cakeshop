class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDatail.find(params[:id])
    @order_details = @order.order_datails.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(order_status: "in_production") if @order_detail.production_status == "in_production"
      @order_details.each do |order_detail|
        if order_detail.production_status != "production_complete"
          is_updated = false
        end
      end
      @order.update(order_status: "preparing_to_ship") if is_updated
    end
    redirect_to admin_order_path(@order)
  end


  private

  def order_detail_params
    params.require(:order_datail).permit(:production_status)
  end

end
