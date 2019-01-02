# code for inserting non profit data from API
require 'rest-client'
require 'json'
require 'pry'

# class Api_communicator
# attr_accessor :page_url
# end

# @page_url = "http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY"

# def import_page_data
 response = RestClient.get("http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY")
 response_hash = JSON.parse(response)
 orgs = response_hash["data"]
# end

# def pull_org_data
#   org_data = []
#   page_data = import_page_data
#   page_data["data"].each do |org|
#     org_data << org
#   end
# end

####################### For db population

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

#######################################

def print_orgs
   response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
   response_hash = JSON.parse(response)
   orgs = response_hash["data"]
   orgs.each do |org|
   puts org["charityName"]
   puts org["ein"]
   end
end
#
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

  def print_cities
    response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
    response_hash = JSON.parse(response)
    orgs = response_hash["data"]
    orgs.each do |org|
    puts "City: #{org['city']}"
  end
end

def print_causes
  response = RestClient.get'http://data.orghunter.com/v1/charitysearch?user_key=ff74d40e5a7c0c5aada5e84ba4030b52&state=NY'
  response_hash = JSON.parse(response)
  orgs = response_hash["data"]
  orgs.each do |org|
  return "Cause:#{org['category']}"
end
end

# print_causes
# puts print_org_by_city("FLUSHING")
# print_org_by_cause('Arts, Culture and Humanities')
# print_org
# zipcode
# url
# ein


# binding.pry
