class AddAcceptedToAppointResponsibles < ActiveRecord::Migration[5.2]
  def change
    add_column :appoint_responsibles, :accepted, :boolean, default: false
  end
end
