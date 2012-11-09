class Tag < ActiveRecord::Base
  attr_accessible :in_trash, :name

  has_many :taggings, :foreign_key => "tag_id", :dependent => :destroy
  has_many :interests, :through => :taggings, :source => :interest
end
