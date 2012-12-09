class Question < ActiveRecord::Base
  attr_accessible :survey_id, :content, :answers_attributes
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  #validates :survey_id, :presence => true
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end