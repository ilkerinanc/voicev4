class Interest < ActiveRecord::Base
  attr_accessible :name, :description, :in_trash, :creator_id, :tag_tokens
  attr_reader :tag_tokens

  has_many :event_interests, :foreign_key => "interest_id", :dependent => :destroy
  has_many :events, :through => :event_interests, :source => :event

  has_many :survey_interests, :foreign_key => "interest_id", :dependent => :destroy
  has_many :surveys, :through => :survey_interests, :source => :survey

  has_many :subscriptions, :foreign_key => "interest_id", :dependent => :destroy
  has_many :subscribers, :through => :subscriptions, :source => :subscribers

  has_many :taggings, :foreign_key => "interest_id", :dependent => :destroy
  has_many :tags, :through => :taggings, :source => :tag

  has_many :interest_posts

  def tag_tokens=(tokens)
  	self.tag_ids = Tag.ids_from_tokens(tokens)
  end

  def self.ids_from_tokens(tokens)
  		tokens.gsub!(/<<<(.+?)>>>/) { create!(:name => $1).id }
  		tokens.split(',')
  end
end
