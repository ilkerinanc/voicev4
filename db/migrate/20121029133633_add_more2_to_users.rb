class AddMore2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_work, :text
  end
end
