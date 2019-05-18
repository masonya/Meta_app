class CreateResponsibilityTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :responsibility_transfers do |t|
      t.string :inheritor_email
      t.integer :transmitter_id
      t.integer :inheritor_id
      t.integer :transferable_id

      t.timestamps
    end
  end
end
