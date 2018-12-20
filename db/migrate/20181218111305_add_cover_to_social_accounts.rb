class AddCoverToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :cover, :string
  end
end
