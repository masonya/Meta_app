class RemoveTransmitterFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :transmitter, :boolean
  end
end
