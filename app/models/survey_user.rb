class SurveyUser < ActiveRecord::Base
  attr_accessible :answerId, :questionId, :surveyId, :userId

  belongs_to :answer
  belongs_to :question
  belongs_to :survey
  belongs_to :user

end
