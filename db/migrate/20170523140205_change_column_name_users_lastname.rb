class ChangeColumnNameUsersLastname < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :Last_name, :last_name
  end
end
