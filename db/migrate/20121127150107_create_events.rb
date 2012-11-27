class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :time
      t.string :place
      t.integer :creator_id
      t.boolean :in_trash

      t.timestamps
    end
  end
end
