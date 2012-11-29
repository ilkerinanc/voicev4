class AddKlassAndKlassIdToUserActivities < ActiveRecord::Migration
  def change
    add_column :user_activities, :klass, :string
    add_column :user_activities, :klass_id, :integer
  end
end
