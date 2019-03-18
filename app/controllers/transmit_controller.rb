class TransmitController < ApplicationController

  def index
    @documents = Document.all
    @instructions = Instruction.all
    @social_accounts = SocialAccount.all
    @subscriptions = Subscription.all
    @wallets = Wallet.all
    @inherited_account = SocialAccount.find_by(params[:id])
    #if @account_transfer.present?
      @account_transfer = @inherited_account.account_transfers.where(transmitter_id: current_user.id)[0]
    #end
  end
#@account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
  # def index
  #   @social_accounts = SocialAccount.all if @social_account.id == current_user.id
  # end
end
