class Tagging < ActiveRecord::Base
  attr_accessible :interest_id, :tag_id

  belongs_to :interest
  belongs_to :tag
end
