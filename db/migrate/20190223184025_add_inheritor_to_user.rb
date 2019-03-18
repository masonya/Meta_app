class AddInheritorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :inheritor, :boolean
  end
end
