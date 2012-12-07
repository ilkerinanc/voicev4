class SurveyUser < ActiveRecord::Base
  attr_accessible :answerId, :questionId, :surveyId, :userId
end
