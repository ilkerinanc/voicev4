class CreateSurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
      t.integer :userId
      t.integer :surveyId
      t.integer :questionId
      t.integer :answerId

      t.timestamps
    end
  end
end
