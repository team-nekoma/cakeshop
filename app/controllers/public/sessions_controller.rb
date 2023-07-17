class Public::SessionsController < ApplicationController
    before_action :withdraw, only: [:create]
    
    protected
    def withdraw
      @customer = Customer.find_by(email: params[:customer][:email])
      return if !@customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
        redirect_to new_customer_registration_path
      end
    end
end
