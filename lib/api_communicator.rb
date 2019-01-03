require 'rest-client'
require 'json'
require 'pry'


#accessing api
 response = RestClient.get("http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY")
 response_hash = JSON.parse(response)
 orgs = response_hash["data"]

# get org name when given an ein number
def name(ein)
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  if org['ein'] = ein
    return org['charityName']
  end
 end
end

#find org city by inputting ein number - to populate db
def city(ein)
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
    if org['ein'] = ein
      return org['city']
    end
  end
end

# find url by ein number - to populate db
def url(ein)
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
    if org['ein'] = ein
      return org['url']
    end
  end
end

# grab ein number - to populate db
def ein(ein)
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
    if org['ein'] = ein
      return org['ein']
    end
  end
end

# get zipcode when you input the ein number
def zipcode(ein)
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
    if org['ein'] = ein
    return org['zipCode']
    end
  end
end

#finds org by given zipcode - 8 digit
def find_by_zipcode(zipcode)
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
    if org['zipCode'] = zipcode
    return org['zipCode']
    end
  end
end

# prints all orgs with the corresponding  name and ein number
def print_orgs
   response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
   response_hash = JSON.parse(response)
   orgs = response_hash["data"]
   orgs.each do |org|
   puts org["charityName"]
   puts org["ein"]
   end
end

#prints specific org info when given an org's ein
def print_org_info(ein)
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
      if org['ein'] = ein
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
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
    if org['city'] == city
      return "Name: #{org['charityName']}"
    end
  end
end

# prints org by cause/category
def print_org_by_cause(category)
    response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
    response_hash = JSON.parse(response)
    orgs = response_hash["data"]
    orgs.each do |org|
      if org['category'] == category
        puts "Name: #{org['charityName']}"
      end
    end
end

# prints org info when inputted a name
  def print_by_org_name(name)
    response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
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
    response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
    response_hash = JSON.parse(response)
    orgs = response_hash["data"]
    orgs.each do |org|
    puts "City: #{org['city']}"
  end
end

# print all org causes
def print_causes
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  return "Cause:#{org['category']}"
end
end

# print all orgs
def print_all
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
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

# binding.pry
