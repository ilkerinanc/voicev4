class AddCreatorIdToDiscussionpost < ActiveRecord::Migration
  def change
    add_column :discussionposts, :creator_id, :integer
  end
end
