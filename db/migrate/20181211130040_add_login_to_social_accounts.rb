class AddLoginToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :login, :string
  end
end
