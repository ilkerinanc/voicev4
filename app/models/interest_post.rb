class InterestPost < ActiveRecord::Base
  attr_accessible :content, :in_trash, :interest_id, :user_id

  belongs_to :interest
  belongs_to :user
end
