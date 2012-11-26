class DiscussionPost < ActiveRecord::Base
  attr_accessible :content, :discussion_id, :in_trash, :user_id
end
