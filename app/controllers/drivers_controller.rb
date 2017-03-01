class DriversController < ApplicationController
  def show
    @driver = current_user.driver
    @orders = @driver.orders
  end
end
