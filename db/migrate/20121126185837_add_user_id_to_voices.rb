class AddUserIdToVoices < ActiveRecord::Migration
  def change
    add_column :voices, :user_id, :integer
  end
end
