class CreateAppointResponsibles < ActiveRecord::Migration[5.2]
  def change
    create_table :appoint_responsibles do |t|
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
