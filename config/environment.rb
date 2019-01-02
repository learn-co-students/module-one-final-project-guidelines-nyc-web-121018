require 'bundler/setup'
Bundler.require
require 'active-record'

# require 'sqlite3'
# require 'pry'
# require 'rest-client'
require_all '../lib'




# Bundler.require
# require_relative '../lib/models/nonprofit.rb'
# require_relative '../lib/models/volunteer.rb'
# require_relative '../lib/models/volunteer_opportunity.rb'
# require_relative '../lib/models/Api_communicator.rb'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/development.sqlite")

ActiveRecord::Base.logger = Logge r.new(STDOUT)
ActiveRecord::Base.logger = nil
