class AddCountToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :count, :integer
  end
end
