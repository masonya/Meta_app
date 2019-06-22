class AddAcceptedToResponsibilityTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :responsibility_transfers, :accepted, :boolean, default: false
  end
end
