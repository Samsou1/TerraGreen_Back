class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_reference :users, :region, null: false, foreign_key: true
    add_reference :users, :country, null: false, foreign_key: true
    add_column :users, :description, :text
    add_column :users, :admin, :boolean
    add_column :users, :notification_subscription, :boolean
  end
end
