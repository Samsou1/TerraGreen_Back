class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
