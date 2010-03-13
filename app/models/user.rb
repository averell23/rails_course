class User < ActiveRecord::Base
  
  has_many :friendships
  has_many :friends, :through => :friendships
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
