require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_friendship
    assert_equal([users(:amy)], users(:bob).friends)
  end
  
  def test_no_name
    foo = User.new
    assert_raises(ActiveRecord::RecordInvalid) { foo.save! }
  end
  
  def test_duplicate_name
    amy2 = make_user("Amy")
    assert_raises(ActiveRecord::RecordInvalid) { amy2.save! }
  end
  
  def test_pass_mismatch
    john = make_user("John")
    john.password_confirmation = "foobar_bar"
    assert_raises(ActiveRecord::RecordInvalid) { john.save! }
  end
  
  def test_duplicate_friend
    assert_raises(ActiveRecord::RecordInvalid) { users(:bob).friends << users(:amy) }
  end
  
  def test_assign_user
    thelma = make_user("Thelma")
    thelma.save!
    thelma.friends << users(:amy)
    thelma.save!
    assert_equal([users(:amy)], thelma.friends)
  end
  
  def test_friend_of
    assert(users(:bob).friend_of?(users(:amy)))
  end
  
  def test_not_friend_of
    assert(!users(:bob).friend_of?(users(:eve)))
  end
  
  private
  
  def make_user(name)
    user = User.new
    user.name = name
    user.email = "#{name}@#{name}.com"
    user.password = "foobar"
    user.password_confirmation = "foobar"
    user
  end
  
end
