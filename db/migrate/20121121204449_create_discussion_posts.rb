class CreateDiscussionPosts < ActiveRecord::Migration
  def change
    create_table :discussion_posts do |t|
      t.text :content
      t.boolean :in_trash
      t.integer :discussion_id
      t.integer :user_id

      t.timestamps
    end
  end
end
