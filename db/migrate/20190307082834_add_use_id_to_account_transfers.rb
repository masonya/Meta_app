class AddUseIdToAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :account_transfers, :user_id, :integer
  end
end
