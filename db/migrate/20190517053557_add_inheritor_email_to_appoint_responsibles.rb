class AddInheritorEmailToAppointResponsibles < ActiveRecord::Migration[5.2]
  def change
    add_column :appoint_responsibles, :inheritor_email, :string
  end
end
