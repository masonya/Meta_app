class AddCoverToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :cover, :string
  end
end
