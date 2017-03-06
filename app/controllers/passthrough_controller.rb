class PassthroughController < ApplicationController
  def minirouter
    if current_user.driver.present?
      redirect_to driver_path(current_user.driver)
    elsif !current_user.driver.present? && !current_user.customer.present? && current_user.present?
      redirect_to verification_codes_new_path
    elsif current_user.customer.orders.present?
      redirect_to customer_path(current_user.customer)
    elsif current_user.customer.present?
      redirect_to new_order_path
    else
      raise
    end
    authorize current_user
  end
end


