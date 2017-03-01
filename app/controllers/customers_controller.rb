class CustomersController < ApplicationController

  def show
    @customer = current_user.customer
    @orders = @customer.orders
    authorize @customer
  end
end
