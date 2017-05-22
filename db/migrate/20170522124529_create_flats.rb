class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :title, null: false
      t.text :description
      t.integer :area, null: false
      t.string :address
      t.string :zip, null: false
      t.integer :price, null: false
      t.boolean :availability
      t.integer :rooms, null: false
      t.string :type, null: false
      t.references :users, foreign_key: true, null: false

      t.timestamps
    end
  end
end
