class DriversController < ApplicationController

  def show
    @driver = current_user.driver
    @orders = @driver.orders
    authorize @driver
  end

  def switch
    @driver = current_user.driver
    @driver.status == "active" ? @driver.deactivate! : @driver.activate!
    redirect_to driver_path(@driver)
    authorize @driver
  end

end
