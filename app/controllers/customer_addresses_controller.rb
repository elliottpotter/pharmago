class CustomerAddressesController < ApplicationController

  def create
    address = current_user.customer.customer_addresses.create(customer_address_params)
    authorize(address)
    respond_to do |format|
      format.js
      format.html { render :index }
    end
  end

  private

  def customer_address_params
    params.require(:customer_address).permit(:address)
  end
end
