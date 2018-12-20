class AddReceiverToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :receiver, :string
  end
end
