class AddCreatorIdColumnToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :creator_id, :integer
  end
end
