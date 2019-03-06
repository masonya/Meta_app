class RemoveReceiverIdFromAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    remove_column :account_transfers, :receiver_id, :integer
  end
end
