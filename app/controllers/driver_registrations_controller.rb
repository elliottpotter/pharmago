class DriverRegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:new]
  layout 'driver_registrations'

  def new
    @user = User.new
    render 'driver_registrations/new'
  end

  def create
    super
    user.driver.create
  end

  def devise_mapping
    Devise.mappings[:user]
  end
end

