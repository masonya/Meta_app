class AddCheckedToAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :account_transfers, :checked, :boolean, default: false
  end
end
