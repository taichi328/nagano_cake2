class Public::CustomersController < ApplicationController
  def edit
    Customer.find_by(email: params[:email])
  end

  def update
    @customer = Customer.find_by(email: params[:customer][:email])
    @customer.update(params[:customer][:email])
    redirect_to customers_my_page_path
  end

  def withdraw
    @customer = Customer.find_by(email: params[:customer][:email])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


   private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end
end
