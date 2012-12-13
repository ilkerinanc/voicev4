class Discussion < ActiveRecord::Base
  attr_accessible :name, :discussionposts_attributes
  has_many :discussionposts, :dependent => :destroy
  accepts_nested_attributes_for :discussionposts, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
