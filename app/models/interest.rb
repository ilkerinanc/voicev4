class Interest < ActiveRecord::Base
  attr_accessible :name, :description, :in_trash, :creator_id

  has_many :subscriptions, :foreign_key => "interest_id", :dependent => :destroy
  has_many :subscribers, :through => :subscriptions, :source => :user

end