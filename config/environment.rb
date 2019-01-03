require 'bundler'
require 'colorize'
require 'colorized_string'
require 'rest-client'
require 'json'
require 'pry'
require 'color'
require_relative '../lib/colorr.rb'
require_relative '../lib/colorr_pallet.rb'
require_relative '../lib/pallet.rb'
require_relative '../lib/user.rb'


Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
