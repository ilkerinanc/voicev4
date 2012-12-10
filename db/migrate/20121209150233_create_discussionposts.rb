class CreateDiscussionposts < ActiveRecord::Migration
  def change
    create_table :discussionposts do |t|
      t.integer :discussion_id
      t.string :content

      t.timestamps
    end
  end
end
