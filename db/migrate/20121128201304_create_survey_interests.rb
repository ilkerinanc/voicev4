class CreateSurveyInterests < ActiveRecord::Migration
  def change
    create_table :survey_interests do |t|
      t.integer :survey_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
