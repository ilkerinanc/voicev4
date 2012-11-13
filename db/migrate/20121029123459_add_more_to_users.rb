class AddMoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :description, :text
    add_column :users, :in_trash, :boolean
    add_column :users, :privilege, :integer
  end
end
