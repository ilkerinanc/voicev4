class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.string :name
      t.text :description
      t.boolean :in_trash
      t.timestamps
    end
  end

  def self.down
    drop_table :interests
  end
end
