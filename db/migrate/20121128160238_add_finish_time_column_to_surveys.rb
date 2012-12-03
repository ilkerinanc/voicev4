class AddFinishTimeColumnToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :finish_time, :datetime
  end
end
