class User < ActiveRecord::Base
  
  acts_as_authentic
  
  has_many :friendships
  has_many :friends, :through => :friendships
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def friend_of?(user)
    self.friends.include?(user)
  end
  
end
