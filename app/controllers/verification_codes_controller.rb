class VerificationCodesController < ApplicationController

  def new
    code               = rand(10000..99999).to_s
    @user              = current_user
    @user.user_code    = code
    @user.save!
    @verification_code = VerificationCode.create(user: @user, code: code)

    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    @client.messages.create(
      from: '+12566335409',
      to:   '+4530203878',
      body: code
    )
    authorize @verification_code
  end

  def verify
    @driver            = current_user.driver
    current_user.user_code == code ? @driver.verify! : @driver
    authorize @driver
  end

end
