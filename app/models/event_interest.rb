class EventInterest < ActiveRecord::Base
  attr_accessible :event_id, :interest_id
  
  belongs_to :interest
  belongs_to :event
end
