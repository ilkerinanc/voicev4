class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :name
      t.integer :creator_id
      t.boolean :in_trash
      t.text :description

      t.timestamps
    end
  end
end
