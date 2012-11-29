class UserActivity < ActiveRecord::Base
  attr_accessible :action, :klass, :klass_id, :user_id

  belongs_to :user

  def to_text

  end
end
