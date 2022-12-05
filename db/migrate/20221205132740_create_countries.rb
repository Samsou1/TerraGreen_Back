class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :acronym
      t.string :country
      t.boolean :active

      t.timestamps
    end
  end
end
