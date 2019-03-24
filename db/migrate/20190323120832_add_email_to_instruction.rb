class AddEmailToInstruction < ActiveRecord::Migration[5.2]
  def change
    add_column :instructions, :email, :string
  end
end
