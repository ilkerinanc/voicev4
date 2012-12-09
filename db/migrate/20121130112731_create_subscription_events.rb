class CreateSubscriptionEvents < ActiveRecord::Migration
  def change
    create_table :subscription_events do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
