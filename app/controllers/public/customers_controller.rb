class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!

  def withdraw
  end

  def withdraw_update
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
end
