class CreateSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :social_accounts do |t|
      t.string :title
      t.string :name
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end
