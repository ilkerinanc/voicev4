class SurveyUser < ActiveRecord::Base
  attr_accessible :answerId, :questionId, :surveyId, :userId

  # belongs_to :answer
  # belongs_to :question
  belongs_to :survey, :foreign_key => 'surveyId'
  belongs_to :user, :foreign_key => 'userId'

end
