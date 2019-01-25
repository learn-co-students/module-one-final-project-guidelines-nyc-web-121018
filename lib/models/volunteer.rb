class Volunteer < ActiveRecord::Base
  has_many :volunteer_opportunities
  has_many :nonprofits, through: :volunteer_opportunities
end
