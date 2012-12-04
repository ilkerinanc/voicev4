class Event < ActiveRecord::Base
	attr_accessible :creator_id, :description, :in_trash, :place, :time, :title, :interest_tokens, :eventphoto

	has_attached_file :eventphoto
	has_many :event_interests, :foreign_key => "event_id", :dependent => :destroy
	has_many :interests, :through => :event_interests, :source => :interest

	has_many :subscription_events, :foreign_key => "event_id", :dependent => :destroy
  has_many :subscribers, :through => :subscription_events, :source => :subscribers
	
	attr_reader :interest_tokens
	
	def interest_tokens=(tokens)
  		self.interest_ids = Interest.ids_from_tokens(tokens)
  	end

  	def get_show_url
  		Rails.application.routes.url_helpers.event_path(self.id)
  	end
end
