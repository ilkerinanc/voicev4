class CreateInterestActivities < ActiveRecord::Migration
  def change
    create_table :interest_activities do |t|
      t.integer :user_id
      t.integer :interest_id
      t.string :action
      t.string :klass
      t.integer :klass_id

      t.timestamps
    end
  end
end
