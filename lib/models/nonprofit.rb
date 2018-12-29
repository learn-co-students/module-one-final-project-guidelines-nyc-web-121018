class Nonprofit < ActiveRecord::Base
  has_many :volunteer_opportunities
  has_many :volunteers, through: :volunteer_opportunities
end
