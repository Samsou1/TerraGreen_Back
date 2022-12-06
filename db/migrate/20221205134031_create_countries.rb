class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.boolean :active
      t.string :acronym

      t.timestamps
    end
  end
end
