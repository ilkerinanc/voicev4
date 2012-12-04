class Voice < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

	def get_show_url
		Rails.application.routes.url_helpers.occasion_path(self.id)
	end
end
