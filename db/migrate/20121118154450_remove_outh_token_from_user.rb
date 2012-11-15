class RemoveOuthTokenFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :outh_token
  end
end
