class SubscriptionEvent < ActiveRecord::Base
  attr_accessible :event_id, :user_id

  belongs_to :event
  belongs_to :subscribers, :class_name => "User", :foreign_key => "user_id"
end
