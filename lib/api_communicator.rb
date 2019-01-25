require 'rest-client'
require 'json'
require 'pry'

#accessing api
def get_orgs
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
 response_hash = JSON.parse(response)
 orgs = response_hash["data"]
 return orgs
end

# get org name when given an ein number
def charityname(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  found_org = orgs.find do |org|
    org["ein"].to_i == ein
  end
  found_org["charityName"]
  end

#find org city by inputting ein number - to populate db
def city(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  found_org = orgs.find do |org|
    org["ein"].to_i == ein
  end
  found_org["city"]
  end

# find url by ein number - to populate db
def url(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  found_org = orgs.find do |org|
  org["ein"].to_i == ein
  end
  found_org["url"]
  end


# grab ein number - to populate db
def ein(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  found_org = orgs.find do |org|
  org["ein"].to_i == ein
  end
  found_org["ein"]
  end

# get zipcode when you input the ein number
def zipcode(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  found_org = orgs.find do |org|
  org["ein"].to_i == ein
  end
  found_org["zipCode"]
  end

def cause(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  found_org = orgs.find do |org|
  org["ein"].to_i == ein
  end
  found_org["category"]
  end

#finds org by given zipcode - 8 digit
def find_by_zipcode(zipcode)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
    if org['zipCode'] == zipcode
    puts ""
    puts "FOUND: #{org['charityName']}"
    puts ""
    end
  end
end

# prints all orgs with the corresponding  name and ein number
def print_orgs
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
   response_hash = JSON.parse(response)
   orgs = response_hash["data"]
   orgs.each do |org|
   puts org["charityName"]
   puts org["ein"]
   end
end

#prints specific org info when given an org's ein
def print_org_info(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
      if org['ein'] == ein
      puts "Name: #{org['charityName']}"
      puts "City: #{org['city']}"
      puts "Zipcode: #{org['zipCode']}"
      puts "EIN: #{org['ein']}"
      puts "Website:#{org['url']}"
      puts "Cause:#{org['category']}"
    end
  end
end

# prints orgs by city
def print_org_by_city(city)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  if org['city'] == city
  puts "Result: #{org['charityName']}"
    end
  end
end

# prints org by cause/category
def print_org_by_cause(category)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
    response_hash = JSON.parse(response)
    orgs = response_hash["data"]
    orgs.each do |org|
      if org['category'] == category
        puts "FOUND: #{org['charityName']}"
        puts "__________________________________"
      end
    end
end

# prints org info when inputted a name
  def print_by_org_name(name)
    response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
    response_hash = JSON.parse(response)
    orgs = response_hash["data"]
    orgs.each do |org|
      if org['charityName'] == name
        puts "Name: #{org['charityName']}"
        puts "City: #{org['city']}"
        puts "Zipcode: #{org['Zipcode']}"
        puts "EIN: #{org['ein']}"
        puts "Website:#{org['url']}"
        puts "Cause:#{org['category']}"
      end
    end
  end

# print all the cities from org list
  def print_cities
    response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
    response_hash = JSON.parse(response)
    orgs = response_hash["data"]
    orgs.each do |org|
    puts "City: #{org['city']}"
  end
end

def available_zipcodes
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  puts "#{org['city']}: #{org['zipCode']}"
end
end

# print all org causes
def print_causes
  causes = []
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  cause = org['category']
  causes << cause
  # puts "Cause:#{org['category']}"
end
 puts causes.uniq
end

def print_eins
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  puts "#{org['charityName']} \n EIN:#{org['ein']}"
  puts "_______________________________________"
end
end

# print all orgs
def print_all
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
      puts "Name: #{org['charityName']}"
      puts "City: #{org['city']}"
      puts "Zipcode: #{org['zipCode']}"
      puts "EIN: #{org['ein']}"
      puts "Website:#{org['url']}"
      puts "Cause:#{org['category']}"
      puts "____________________________"
  end
end

def org_by_ein(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  if org['ein'] == ein
  puts "Result: #{org['charityName']}"
  end
 end
end

def org_by_name(name)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  if org['charityName'] == name
    puts "Name: #{org['charityName']}"
    puts "City: #{org['city']}"
    puts "Zipcode: #{org['zipCode']}"
    puts "EIN: #{org['ein']}"
    puts "Website:#{org['url']}"
    puts "Cause:#{org['category']}"
    puts "____________________________"
  end
 end
end

def get_url_by_ein(ein)
  response = RestClient.get"http://data.orghunter.com/v1/charitysearch?user_key=#{ENV['API_KEY']}&state=NY"
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  if org['ein'] == ein
  puts "Result: #{org['url']}"
  end
 end
end

def add_volunteer(first_name,last_name, age)
 Volunteer.create(id: nil ,first_name: first_name, last_name:last_name, age:age)
 puts ""
 puts "Thank you, #{first_name} you have been added!👍"
 puts ""
end
# binding.pry
