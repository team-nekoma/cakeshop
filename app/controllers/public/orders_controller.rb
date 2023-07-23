class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @orders = current_customer.orders
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_number] == "1"
      @order.postcode = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_number] == "2"
      @order.post_code = Address.find(params[:order][:address]).post_code
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).name

      # address = Address.find(params[:order][:customer_id])
      # @order.post_code = address.post_code
      # @order.address = address.address
      # @order.name = address.name

    elsif params[:order][:address_number] ==  "3"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'index'
    end

    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer.id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.quantity = cart_item.quantity
      # @order_item.price_including_tax =
      @order_item.order_id = @order.id
      @order_item.save
    end

    current_customer.cart_items.destoroy_all
    redirect_to complete_orders_path
    
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :payment, :name, :postcode, :address, :order_status, :shipping_fee)
  end
end