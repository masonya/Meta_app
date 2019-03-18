class AddEmailToSocialAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :email, :string
  end
end
