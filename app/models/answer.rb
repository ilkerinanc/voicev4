class Answer < ActiveRecord::Base
  attr_accessible :question_id, :content, :count
  #validates :question_id, :presence => true
  belongs_to :question
end