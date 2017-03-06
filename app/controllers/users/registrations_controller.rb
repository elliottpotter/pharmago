class Users::RegistrationsController < Devise::RegistrationsController

  require 'authy'
  before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  layout 'signup_page', :only => [:new]

  # GET /resource/sign_up
  # def new
  #   super
  # end


  # POST /resource
  def create
    super
    create_customer if params[:commit].match(/customer/)
  end

  def create_customer
    Customer.create(user: @user)
  end

  def create_driver
    Driver.create(user: @user)
  end



  def verify
    @user = current_user

    # Use Authy to send the verification token
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?
      # Mark the user as verified for get /user/:id
      @user.update(verified: true)

      # Send an SMS to the user 'success'
      send_message("You did it! Signup complete :)")

      # Show the user profile
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

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
