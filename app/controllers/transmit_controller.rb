class TransmitController < ApplicationController

  def index
    @documents = Document.all
    @instructions = Instruction.all
    @social_accounts = SocialAccount.all
    @subscriptions = Subscription.all
    @wallets = Wallet.all
  end
end
