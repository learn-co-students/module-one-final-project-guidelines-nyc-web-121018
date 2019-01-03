class VolunteerOpportunity < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :volunteer
end
