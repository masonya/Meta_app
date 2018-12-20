class CreateAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :account_transfers do |t|
      t.integer :transmitter_id
      t.integer :receiver_id
      t.integer :transferable_id
      t.string :transferable_type
      t.timestamps
    end
  end
end
