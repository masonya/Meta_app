class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from 'ActionController::UnknownFormat' do |exception|
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end

  helper_method :current_user


  def index
    #@social_accounts = current_user.social_accounts
    @inherited_accounts = AccountTransfer.find(parms[:inheritor_id])
  end


end
