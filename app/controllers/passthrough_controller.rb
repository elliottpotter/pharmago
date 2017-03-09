class PassthroughController < ApplicationController
  def minirouter
    if current_user.driver.present?
      redirect_to driver_path(current_user.driver)
    elsif current_user.customer.orders.present?
      redirect_to customer_path(current_user.customer)
    elsif current_user.customer.present?
      redirect_to customer_path(current_user.customer)
    else
      raise
    end
    authorize current_user
  end
end


