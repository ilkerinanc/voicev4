class AddTimeToOccasions < ActiveRecord::Migration
  def change
    add_column :occasions, :time, :date
  end
end
