class AddPasswordToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :password, :string
  end
end
