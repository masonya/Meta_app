class MemoryController < ApplicationController
  def index
    @inherited_accounts = current_user.inherited_accounts
  end
end
