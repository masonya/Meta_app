class AddEmailToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :email, :string
  end
end
