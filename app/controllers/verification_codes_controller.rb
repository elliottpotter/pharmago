class VerificationCodesController < ApplicationController

  def new
    code            = rand(1000..9999).to_s
    @user           = current_user
    @user.user_code = code
    @user.save!
    @verification_code = VerificationCode.new

    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    @client.messages.create(
      from: '+12566335409',
      to: '+4530203878',
      body: code
    )
    authorize @verification_code
  end

  def create
    if current_user.user_code == @code
      raise
      @user = params[:user]
      @driver = Driver.create(user: User.find(current_user.id))
    end
    authorize @driver
  end

end
