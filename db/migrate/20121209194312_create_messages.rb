class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
