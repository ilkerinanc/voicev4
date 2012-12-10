class Message < ActiveRecord::Base
  attr_accessible :content, :receiver_id, :sender_id, :receiver_name
  belongs_to :receiver, :class_name => "User"
  belongs_to :sender, :class_name => "User"

  validates :sender_id, :presence => true
  validates :receiver_id, :presence => true
  validates :content, :presence => true
  default_scope :order => 'messages.created_at DESC'

  def receiver_name
  	receiver.try(:username)
  end

  def receiver_name=(username)
    self.receiver = User.find_by_username(username) if username.present?
  end

end
