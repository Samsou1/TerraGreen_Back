class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_reference :users, :region, null: true, foreign_key: true
    add_reference :users, :country, null: true, foreign_key: true
    add_column :users, :description, :text
    add_column :users, :admin, :boolean, default: false
    add_column :users, :notification_subscription, :boolean, default: false
  end
end
