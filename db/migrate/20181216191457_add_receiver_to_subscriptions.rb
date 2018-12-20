class AddReceiverToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :receiver, :string
  end
end
