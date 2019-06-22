class AddFileToAppointResponsibles < ActiveRecord::Migration[5.2]
  def change
    add_column :appoint_responsibles, :file, :string
  end
end
