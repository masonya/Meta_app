class TransmitController < ApplicationController
  def index
    @transfered_accounts = current_user.transfered_accounts
  end
end
