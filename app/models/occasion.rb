class Occasion < ActiveRecord::Base
  attr_accessible :creator_id, :description, :in_trash, :name, :time

  	def get_show_url
  		Rails.application.routes.url_helpers.occasion_path(self.id)
  	end
end
