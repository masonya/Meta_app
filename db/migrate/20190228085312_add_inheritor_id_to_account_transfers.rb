class AddInheritorIdToAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :account_transfers, :inheritor_id, :integer
  end
end
