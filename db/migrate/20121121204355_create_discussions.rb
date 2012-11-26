class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :name
      t.text :description
      t.boolean :in_trash
      t.integer :creator_id

      t.timestamps
    end
  end
end
