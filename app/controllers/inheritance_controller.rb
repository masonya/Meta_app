class InheritanceController < ApplicationController

  def index
    #@social_accounts = current_user.social_accounts
    @inherited_accounts = current_user.inherited_accounts
    # @inherited_responsibilitys = current_user.inherited_responsibilitys
    #@inherited_responsibilitys = AppointResponsible.where(:inheritor_id => current_user.id)
    @appoint_responsible = AppointResponsible.new
  end

  def show
    @inherited_accounts = current_user.inherited_accounts
    @appoint_responsible = AppointResponsible.new
  end


end
