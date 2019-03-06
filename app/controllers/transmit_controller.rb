class TransmitController < ApplicationController

  def index
    @documents = Document.all
    @instructions = Instruction.all
    @social_accounts = SocialAccount.all
    @subscriptions = Subscription.all
    @wallets = Wallet.all
  end

  # def index
  #   @social_accounts = SocialAccount.all if @social_account.id == current_user.id
  # end
end
