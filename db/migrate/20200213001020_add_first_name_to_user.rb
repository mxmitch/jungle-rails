class AddFirstNameToUser < ActiveRecord::Migration
  def change
    remove_column :users, :name
    add_column :users, :first_name, :column_type, first: true
    add_column :users, :last_name, after: :first_name
  end
end