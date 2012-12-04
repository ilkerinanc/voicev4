class SurveyInterest < ActiveRecord::Base
  attr_accessible :interest_id, :survey_id

  belongs_to :interest
  belongs_to :survey
end
