class AddReceiverToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :receiver, :string
  end
end
