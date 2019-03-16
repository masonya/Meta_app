class ObtainController < ApplicationController
  def index
    @social_accounts = current_user.social_accounts
    @inherited_accounts = current_user.inherited_accounts
    # @account_transfers = AccountTransfer.all
  end


end
