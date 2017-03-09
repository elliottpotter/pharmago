class DriversController < ApplicationController

  def show
    @driver             = current_user.driver
    @orders             = @driver.orders
    @available_orders   = Order.unclaimed
    @hello              = "Hello!"
    authorize @driver
  end

  def switch
    @driver             = current_user.driver
    @driver.status      == "active" ? @driver.deactivate! : @driver.activate!
    redirect_to driver_path(@driver)
    authorize @driver
  end

  def verify
    code                = params[:verification_code]
    @driver             = current_user.driver
    current_user.user_code == code ? @driver.verify! : @driver
    redirect_to driver_path(@driver)
    authorize @driver
  end

end
