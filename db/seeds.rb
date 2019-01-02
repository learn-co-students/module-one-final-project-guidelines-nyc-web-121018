require_relative '../lib/api_communicator.rb'
require_relative '../config/environment.rb'
require 'faker'
require 'pry'

org_eins = [161417558,
222255236,
341991881,
161570443,
208019750,
136015737,
133387460,
136160961,
208497018,
132855637,
112436227,
237129473,
133258307,
201438492,
113206981,
236489740,
116027807,
133325111,
133691071,
300456687]

response = RestClient.get("http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY")
response_hash = JSON.parse(response)
orgs = response_hash["data"]

# @page_url = "http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY"
#   @org_array = pull_org_data
#   @org_array.each do |org|
#     new_nonprofit = Nonprofit.new(
#       name: org[“charityName”],
#       city: org["city"],
#       url: org[“url”],
#       ein: org["ein"],
#       zipcode: org["zipCode"]
#     )
#     new_nonprofit.save
#   end

def populate_nonprofit_table(org_eins)
  org_eins.each do |ein|
  Nonprofit.create(charityName: name(ein),city: city(ein), url: url(ein), ein:ein(ein), zipcode: zipcode(ein))
end
end

binding.pry
# populate_nonprofit_table(org_eins)
# #code for inserting volunteer data using faker
# puts "creating volunteers"
# 40.times do
#   Volunteer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: (0..100).to_a.sample)
# end
# puts "made"
