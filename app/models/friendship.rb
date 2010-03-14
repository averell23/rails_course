class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  
  validates_uniqueness_of :friend_id, :scope => :user_id
  
  # Sets the friend through the email given
  def friend_email=(value)
    new_friend = User.find(:first, :conditions => { :email => value })
    raise(ActiveRecord::RecordNotFound) unless(new_friend)
    self.friend = new_friend
  end
  
  def friend_email
    friend ? friend.email : nil
  end
end
