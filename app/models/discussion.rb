class Discussion < ActiveRecord::Base
	attr_accessible :creator_id, :description, :in_trash, :name
  	has_many :discussion_posts
end
