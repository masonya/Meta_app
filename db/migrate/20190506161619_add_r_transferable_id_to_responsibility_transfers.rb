class AddRTransferableIdToResponsibilityTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :responsibility_transfers, :r_transferable_id, :integer
  end
end
