class AddEmailToAccountTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :account_transfers, :email, :string
  end
end
