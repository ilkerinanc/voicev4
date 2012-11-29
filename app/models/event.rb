class Event < ActiveRecord::Base
	attr_accessible :creator_id, :description, :in_trash, :place, :time, :title, :interest_tokens

	has_many :event_interests, :foreign_key => "event_id", :dependent => :destroy
	has_many :interests, :through => :event_interests, :source => :interest
	
	attr_reader :interest_tokens
	
	def interest_tokens=(tokens)
  		self.interest_ids = Interest.ids_from_tokens(tokens)
  	end

  	def get_show_url
  		Rails.application.routes.url_helpers.event_path(self.id)
  	end
end
