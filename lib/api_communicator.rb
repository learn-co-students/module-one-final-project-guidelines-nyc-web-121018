require 'rest-client'
require 'json'
require 'pry'

## one key refactoring step will be:
## make_api_call(house, votes)
## make_api_call(senate, bills) etc

def get_specific_bill_from_api(pp_bill_id)
  api_url = "https://api.propublica.org/congress/v1/#{pp_bill_id.split("-")[1].to_s}/bills/#{pp_bill_id.split("-")[0].to_s}.json"
  response_string = RestClient::Request.execute(
    :method => :get,
    :url => api_url,
    #version: v1,
    :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
    #:headers => {'authorization': ENV['PRO_PUBLICA_API_KEY']}
    #'X-API-KEY': ENV['PRO_PUBLICA_API_KEY']
  )
  response_hash = JSON.parse(response_string)
end

def get_rep_from_api
## THIS WORKS!!
 api_url = "https://api.propublica.org/congress/v1/115/house/members.json"
##  api_url = "https://api.propublica.org/congress/v1/115/house/votes.json"
  response_string = RestClient::Request.execute(
    :method => :get,
    :url => api_url,
    #version: v1,
    :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
    #:headers => {'authorization': ENV['PRO_PUBLICA_API_KEY']}
    #'X-API-KEY': ENV['PRO_PUBLICA_API_KEY']
  )
  response_hash = JSON.parse(response_string)
end

def get_sen_from_api
 api_url = "https://api.propublica.org/congress/v1/115/senate/members.json"
  response_string = RestClient::Request.execute(
    :method => :get,
    :url => api_url,
    :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
  )
  response_hash = JSON.parse(response_string)
end

def get_house_votes_from_api
    api_url = "https://api.propublica.org/congress/v1/house/votes/recent.json"
    response_string = RestClient::Request.execute(
      :method => :get,
      :url => api_url,
      #version: v1,
      :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
      #:headers => {'authorization': ENV['PRO_PUBLICA_API_KEY']}
      #'X-API-KEY': ENV['PRO_PUBLICA_API_KEY']
    )
    response_hash = JSON.parse(response_string)
end

def get_senate_votes_from_api
    api_url = "https://api.propublica.org/congress/v1/senate/votes/recent.json"
    response_string = RestClient::Request.execute(
      :method => :get,
      :url => api_url,
      #version: v1,
      :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
      #:headers => {'authorization': ENV['PRO_PUBLICA_API_KEY']}
      #'X-API-KEY': ENV['PRO_PUBLICA_API_KEY']
    )
    response_hash = JSON.parse(response_string)
end

def get_member_votes_from_api(member)
  api_url = "https://api.propublica.org/congress/v1/members/#{member}/votes.json"
  response_string = RestClient::Request.execute(
    :method => :get,
    :url => api_url,
    #version: v1,
    :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
    #:headers => {'authorization': ENV['PRO_PUBLICA_API_KEY']}
    #'X-API-KEY': ENV['PRO_PUBLICA_API_KEY']
  )
  response_hash = JSON.parse(response_string)
end
        #### too many results, 78,000+, 150+ per member


def get_house_bills_from_api
  api_url = "https://api.propublica.org/congress/v1/115/house/bills/passed.json"
  response_string = RestClient::Request.execute(
    :method => :get,
    :url => api_url,
    :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
  )
  response_hash = JSON.parse(response_string)
end

def get_senate_bills_from_api
  api_url = "https://api.propublica.org/congress/v1/115/senate/bills/passed.json"
  response_string = RestClient::Request.execute(
    :method => :get,
    :url => api_url,
    :headers => {"X-API-Key" => ENV['PRO_PUBLICA_API_KEY']}
  )
  response_hash = JSON.parse(response_string)
end


## todo does the API have issues or am I building that chart?
