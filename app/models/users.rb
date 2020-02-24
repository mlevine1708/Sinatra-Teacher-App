class Users < ActiveRecord::Base 
  has_secure_password
  validates_presence_of :username, :password
  has_many :assignments
  has_many :students
end