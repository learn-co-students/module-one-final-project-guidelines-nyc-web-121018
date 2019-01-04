class Vote < ActiveRecord::Base
  belongs_to :bill
  belongs_to :representative
end ## <<-- end of Vote class
