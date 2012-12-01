class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.integer :user_id
      t.string :type
      t.integer :type_id
      t.string :action

      t.timestamps
    end
  end
end
