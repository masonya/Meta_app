class AddAcceptedToAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :account_transfers, :accepted, :boolean, default: false
  end
end
