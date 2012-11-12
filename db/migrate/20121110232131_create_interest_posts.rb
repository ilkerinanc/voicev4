class CreateInterestPosts < ActiveRecord::Migration
  def change
    create_table :interest_posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :interest_id
      t.boolean :in_trash

      t.timestamps
    end
  end
end
