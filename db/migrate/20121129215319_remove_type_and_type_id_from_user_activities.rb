class RemoveTypeAndTypeIdFromUserActivities < ActiveRecord::Migration
  def change
    remove_column :user_activities, :type
    remove_column :user_activities, :type_id
  end
end
