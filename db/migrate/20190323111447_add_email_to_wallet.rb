class AddEmailToWallet < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :email, :string
  end
end
