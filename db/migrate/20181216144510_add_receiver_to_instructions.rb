class AddReceiverToInstructions < ActiveRecord::Migration[5.2]
  def change
    add_column :instructions, :receiver, :string
  end
end
