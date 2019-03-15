class CreateAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :account_transfers do |t|
      t.integer :transmitter_id
      t.integer :transferable_id
      t.string :transferable_type
      t.string :email
      t.integer :inheritor_id
      t.string :inheritor_email
      t.string :user_id
      t.timestamps
    end
  end
end
