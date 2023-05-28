class Admin::OrdersController < ApplicationController
   @order = Order.find(params[:id])
end
