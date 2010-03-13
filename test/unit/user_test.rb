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
    amy2 = User.new
    amy2.name = "Amy"
    assert_raises(ActiveRecord::RecordInvalid) { amy2.save! }
  end
  
  def test_duplicate_friend
    steve = User.new
    steve.name = "Steve"
    steve.friends << users(:amy)
    steve.friends << users(:amy)
    assert_raises(ActiveRecord::RecordInvalid) { steve.save! }
  end
  
  def test_assign_user
    thelma = User.new
    thelma.name = "Thelma"
    thelma.friends << users(:amy)
    thelma.save!
    assert_equal([users(:amy)], thelma.friends)
  end
  
end
