class Subscription < ActiveRecord::Base
  attr_accessible :interest_id, :user_id

  belongs_to :interest
  belongs_to :subscribers, :class_name => "User", :foreign_key => "user_id"
end
