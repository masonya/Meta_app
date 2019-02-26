class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from 'ActionController::UnknownFormat' do |exception|
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end
