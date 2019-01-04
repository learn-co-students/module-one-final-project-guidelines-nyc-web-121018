class Representative < ActiveRecord::Base
  has_many :votes
  has_many :bills, through: :votes
  has_many :user_reps
  has_many :users, through: :user_reps


end ## <<-- end of Representative class

## TODO : create a migration file that saves the following info for everyone
## in the database, along with are they senate or house members
##


# {
#      ##           "id": "B001288",
#                 "title": "Senator, 2nd Class",
#                 "short_title": "Sen.",
#                 "api_uri": "https://api.propublica.org/congress/v1/members/B001288.json",
#      ##           "first_name": "Cory",
#                 "middle_name": null,
#      ##           "last_name": "Booker",
#                 "suffix": null,
#                 "date_of_birth": "1969-04-27",
#                 "gender": "M",
#      ##           "party": "D",
#                 "leadership_role": null,
#                 "twitter_account": "CoryBooker",
#                 "facebook_account": null,
#                 "youtube_account": "SenCoryBooker",
#                 "govtrack_id": "412598",
#                 "cspan_id": "84679",
#                 "votesmart_id": "76151",
#                 "icpsr_id": "41308",
#                 "crp_id": "N00035267",
#                 "google_entity_id": "/m/06p430",
#                 "fec_candidate_id": "S4NJ00185",
#                 "url": "https://www.booker.senate.gov",
#                 "rss_url": "https://www.booker.senate.gov/rss/",
#                 "contact_form": "https://www.booker.senate.gov/?p=contact",
#      ##           "in_office": true,
#                 "dw_nominate": -0.626,
#                 "ideal_point": null,
#                 "seniority": "5",
#                 "next_election": "2020",
#                 "total_votes": 444,
#                 "missed_votes": 25,
#                 "total_present": 1,
#                 "last_updated": "2018-06-13 07:45:27 -0400",
#                 "ocd_id": "ocd-division/country:us/state:nj",
#                 "office": "359 Dirksen Senate Office Building",
#                 "phone": "202-224-3224",
#                 "fax": "202-224-8378",
#      ##           "state": "NJ",
#                 "senate_class": "2",
#                 "state_rank": "junior",
#                 "lis_id": "S370",
#                 "missed_votes_pct": 5.63,
#      ##           "votes_with_party_pct": 83.53
#             }
