class Event < ActiveRecord::Base
	attr_accessible :creator_id, :description, :in_trash, :place, :time, :title, :interest_tokens, :eventphoto

	# has_attached_file :eventphoto
	
	has_many :event_interests, :foreign_key => "event_id", :dependent => :destroy
	has_many :interests, :through => :event_interests, :source => :interest

	has_many :subscription_events, :foreign_key => "event_id", :dependent => :destroy
  has_many :subscribers, :through => :subscription_events, :source => :subscribers
	
	validates_presence_of :title, :allow_blank => true
	validates_length_of :title, :minimum => 4, :maximum => 25, :allow_blank => true
	validates_presence_of :description, :allow_blank => true
	validates_presence_of :place, :allow_blank => true
	validates_presence_of :time, :allow_blank => true
	validates_uniqueness_of :title	

	attr_reader :interest_tokens
	
	def interest_tokens=(tokens)
  		self.interest_ids = Interest.ids_from_tokens(tokens)
  	end

  	def get_show_url
  		if ENV['RAILS_ENV'] == 'production'
  			"voicev4/#{Rails.application.routes.url_helpers.event_path(self.id)}"
  		else
  			Rails.application.routes.url_helpers.event_path(self.id)
  		end
  	end
end
