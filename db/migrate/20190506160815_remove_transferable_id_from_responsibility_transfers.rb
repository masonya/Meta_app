class RemoveTransferableIdFromResponsibilityTransfers < ActiveRecord::Migration[5.2]
  def change
    remove_column :responsibility_transfers, :transferable_id, :integer
  end
end
