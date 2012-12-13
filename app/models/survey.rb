class Survey < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :answers_attributes, :start_time, :finish_time, :interest_tokens
  has_many :questions, :dependent => :destroy
  validates :name, :presence => true 
  validates :start_time, :presence => true
  validates :finish_time,  :presence => true
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  has_many :survey_interests, :foreign_key => "survey_id", :dependent => :destroy
  has_many :interests, :through => :survey_interests, :source => :interest


  attr_reader :interest_tokens
	
	def interest_tokens=(tokens)
  		self.interest_ids = Interest.ids_from_tokens(tokens)
  end

  def get_show_url
    Rails.application.routes.url_helpers.survey_path(self.id)
  end
end