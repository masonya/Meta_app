class AddRTransferableTypeToResponsibilityTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :responsibility_transfers, :r_transferable_type, :string
  end
end
