class Volunteer_opportunity < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :volunteer
end
