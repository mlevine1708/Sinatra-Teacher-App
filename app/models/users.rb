class Users < ActiveRecord::Base 
  has_secure_password
  has_many :assignments
  has_many :students
end