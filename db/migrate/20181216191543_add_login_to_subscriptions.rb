class AddLoginToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :login, :string
  end
end
