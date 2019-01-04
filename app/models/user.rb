class User < ActiveRecord::Base
  has_many :user_reps
  has_many :representatives, through: :user_reps
  #has_many :bills
#  has_many :issues
end ## <<-- end of User class
