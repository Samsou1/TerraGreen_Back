class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.references :project_status, null: false, foreign_key: true
      t.date :date
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :GPS
      t.references :region, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
