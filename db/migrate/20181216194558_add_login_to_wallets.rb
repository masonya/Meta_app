class AddLoginToWallets < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :login, :string
  end
end
