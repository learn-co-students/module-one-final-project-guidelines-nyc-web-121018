class Bill < ActiveRecord::Base
  has_many :votes
  has_many :representatives, through: :votes
end ## <<-- end of Bill class
