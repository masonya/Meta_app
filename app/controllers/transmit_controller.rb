class TransmitController < ApplicationController
  def index
    @transfered_accounts = current_user.transfered_accounts
    @appoint_responsible = AppointResponsible.new
  end
end
