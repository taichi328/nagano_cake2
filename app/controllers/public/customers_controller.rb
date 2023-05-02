class Public::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def update

  end
  
  
   private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end
end
