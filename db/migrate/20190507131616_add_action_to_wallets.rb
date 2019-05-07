class AddActionToWallets < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :action, :string
  end
end
