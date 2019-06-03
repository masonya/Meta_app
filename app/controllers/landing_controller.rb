class LandingController < ApplicationController
  def index
   @appoint_responsible = AppointResponsible.new
   @inherited_accounts = current_user.inherited_accounts
  end
end
