class AddCreatorIdToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :creator_id, :integer
  end
end
