class Discussion < ActiveRecord::Base
  attr_accessible :creator_id, :description, :in_trash, :name
end
