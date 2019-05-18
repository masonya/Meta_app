class CreateDeathCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :death_certificates do |t|
      t.string :file

      t.timestamps
    end
  end
end
