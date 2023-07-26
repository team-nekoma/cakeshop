class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!
   
   def show
    @customer = current_customer
    @customers = Customer.all
    @orders = Order.all
   end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "登録情報が更新されました。"
    else
      render :edit
    end
  end

  def withdraw
  end

  def withdraw_update
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :email)
  end
end
