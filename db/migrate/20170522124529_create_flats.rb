class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :string
      t.text :description
      t.integer :area
      t.string :address
      t.string :zip
      t.integer :price
      t.boolean :availability
      t.integer :rooms
      t.string :type
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
