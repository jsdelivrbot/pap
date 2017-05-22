class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :flats, :type, :category
  end
end
