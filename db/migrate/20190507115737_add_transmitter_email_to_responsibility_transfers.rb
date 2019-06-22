class AddTransmitterEmailToResponsibilityTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :responsibility_transfers, :transmitter_email, :string
  end
end
