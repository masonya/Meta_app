class AddInheritorIdToAppointResponsibles < ActiveRecord::Migration[5.2]
  def change
    add_column :appoint_responsibles, :inheritor_id, :integer
  end
end
