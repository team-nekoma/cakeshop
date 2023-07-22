class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
     @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :post_code, :address, :phone_number, :is_deleted)
  end
end
