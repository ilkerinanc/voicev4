class Interest < ActiveRecord::Base
  attr_accessible :name, :description, :in_trash, :creator_id, :tag_tokens
  attr_reader :tag_tokens

  has_many :subscriptions, :foreign_key => "interest_id", :dependent => :destroy
  has_many :subscribers, :through => :subscriptions, :source => :subscribers

  has_many :taggings, :foreign_key => "interest_id", :dependent => :destroy
  has_many :tags, :through => :taggings, :source => :tag

  def tag_tokens=(ids)
  	self.tag_ids=ids.split(',')
  end
end