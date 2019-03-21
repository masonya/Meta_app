class AddEmailToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :email, :string
  end
end
