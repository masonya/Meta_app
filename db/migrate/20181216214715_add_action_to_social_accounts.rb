class AddActionToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :action, :string
  end
end
