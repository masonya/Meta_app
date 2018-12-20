class AddReceiverToWallets < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :receiver, :string
  end
end
