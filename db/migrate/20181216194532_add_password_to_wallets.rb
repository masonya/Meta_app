class AddPasswordToWallets < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :password, :string
  end
end
