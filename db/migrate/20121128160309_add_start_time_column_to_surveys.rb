class AddStartTimeColumnToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :start_time, :datetime
  end
end
