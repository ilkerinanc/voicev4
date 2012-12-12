class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :notification
      t.integer :activity_type
      t.integer :profile_visibility
      t.integer :user_id

      t.timestamps
    end
  end
end
