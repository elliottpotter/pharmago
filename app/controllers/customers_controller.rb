class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
end
