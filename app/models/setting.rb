class Setting < ActiveRecord::Base
  attr_accessible :activity_type, :notification, :profile_visibility, :user_id
  belongs_to :user
end
