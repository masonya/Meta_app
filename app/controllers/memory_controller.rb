class MemoryController < ApplicationController
  def index
    @inherited_accounts = current_user.inherited_accounts
    @appoint_responsible = AppointResponsible.new
  end
end
