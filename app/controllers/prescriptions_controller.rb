class PrescriptionsController < ApplicationController
  def new
  end


  def create
    raise
    Prescription.create(params[:prescription])
  end
end
