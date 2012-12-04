class User < ActiveRecord::Base
  recommends :interests, :users, :events

  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :direct_friends, :through => :friendships, :conditions => "approved = true", :source => :friend
  has_many :inverse_friends, :through => :inverse_friendships, :conditions => "approved = true", :source => :user

  has_many :pending_friends, :through => :friendships, :conditions => "approved = false", :foreign_key => "user_id", :source => :friend
  has_many :requested_friendships, :class_name => "Friendship", :foreign_key => "friend_id", :conditions => "approved = false"

  has_many :subscriptions, :foreign_key => "user_id", :dependent => :destroy
  has_many :interests, :through => :subscriptions, :source => :interest

  has_many :subscription_events, :foreign_key => "user_id", :dependent => :destroy
  has_many :events, :through => :subscription_events, :source => :event


  has_many :voices

  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation, :name, :surname, :description, :current_work

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  # validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def self.from_omniauth(auth)
    where(:email => auth.info.email).first_or_initialize.tap do |user|
      if user.username.nil?
        if auth.extra.raw_info.username.present?
          user.username = auth.extra.raw_info.username
        else
          user.username = auth.info.email
        end
      end

      if user.name.nil?
        user.name = auth.info.first_name
      end

      if user.surname.nil?
        user.surname = auth.info.last_name
      end

      if user.email.nil?
        user.email = auth.info.email
      end

      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      @graph = Koala::Facebook::API.new(user.oauth_token)
      user.description = @graph.get_connections("me", "likes")

      user.save!
    end
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  def friends
    direct_friends | inverse_friends
  end

  def friend_request_sent?(user)
    return self.pending_friends.include?(user)
  end

  def friend_request_pending?(user)
    return self.requested_friendships.collect(&:user_id).include?(user.id)
  end

  def friends_with?(user)
    return self.friends.include?(user)
  end

  def subscribed?(interest)
    return self.interests.include?(interest)
  end

  def event_subscribed?(event)
    return self.events.include?(event)
  end

  def friends_in_common(user)
    return self.friends & user.friends
  end

  def interests_in_common(user)
    return self.interests & user.interests
  end

  def friendship_score(user)
    return (self.friends_in_common(user).count / self.friends.count).to_f
  end

  def get_show_url
    Rails.application.routes.url_helpers.user_show_path(self.id)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
