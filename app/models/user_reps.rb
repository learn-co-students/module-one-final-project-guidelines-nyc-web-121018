class UserRep < ActiveRecord::Base
  belongs_to :user
  belongs_to :representative
end
