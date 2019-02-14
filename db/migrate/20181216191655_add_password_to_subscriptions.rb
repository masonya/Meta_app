class AddPasswordToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :password, :string
  end
end
