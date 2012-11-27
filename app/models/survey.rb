class Survey < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :answers_attributes, :start_time, :finish_time
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end