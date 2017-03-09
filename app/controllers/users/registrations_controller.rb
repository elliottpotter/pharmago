class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  layout 'signup_page', :only => [:new]

  def create
    super
    params[:commit].match(/customer/) ? create_customer : create_driver
  end

  def create_customer
    Customer.create(user: @user)
  end

  def create_driver
    @driver = Driver.create(user: @user, verification_code: rand(10000..99999).to_s)
    send_code
  end

  private

  def send_code
    code               = @driver.verification_code
    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    @client.messages.create(
      from: '+12566335409',
      to:   '+4530203878',
      body: code
    )
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :country_code, :authy_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
