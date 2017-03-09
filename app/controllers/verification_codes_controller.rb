class VerificationCodesController < ApplicationController
  def all
    VerificationCode.all
  end
end
