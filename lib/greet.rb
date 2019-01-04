# require "./config/environment.rb"
require 'pry'

eins = [
161417558,
# : CENTER OF SOLITUDE INC,
222255236,
# : CORBETT COMMUNITY CORPORATION,
341991881,
# : LONG ISLAND SOCIETY OTOLARYNGOLOGY HEAD AND NECK SURGERY INC,
161570443,
# : ORLEANS RENAISSANCE GROUP INC,
208019750,
# : BEIT DAVID AND RAFAEL,
136015737,
# : GREATER ROCHESTER NY SPINA BIFIDA ASSOCIATION,
133387460,
# : THE CORNER STORE DANCE COMPANY INC,
136160961,
# : DRAMA LEAGUE OF NEW YORK INC,
208497018,
# : SURVIVAL THROUGH EDUCATION INC,
132855637,
# : UNIVERSITY OF PENNSYLVANIA,
112436227,
# : MARINE ENVIRONMENTAL COUNCIL OF
237129473,
# : JAMES P & RUTH C GILLROY FOUNDATION INC,
133258307,
# : WESTCHESTER COMMUNITY SERVICES FOR,
201438492,
# : FREE ZONE MEMBERS DANCE SOCIAL CLUB,
113206981,
# : PTA NEW YORK CONGRESS,
236489740,
# : H PORTER RATHMELL SCHOL TR UA,
116027807,
# : THE SOUTHAMPTON COLONIAL SOCIETY,
133325111,
# : EASTERN BEDFORD ENVIRONMENTAL,
133691071,
 # FRIENDS OF THE BUDAPEST OPERA INC,
300456687
# EMPIRE STATE FOUNDATION
]
# def list(eins)
#   eins.each_with_index do |ein, i|
#     puts "#{i+1}. #{ein}"
#   end
# end

def welcome
puts "Welcome to Nonprofit Matcher! What is your name?"
name = gets.strip
puts "Hi #{name}"
end

def prompt_user
  input =""
  while input
    puts "Please make a selection(ex: 1,2,3):
    1. View all organizations
    2. View all EIN #'s
    3. Search for org by EIN
    4. Find a nonprofit by city
    5. Find a nonprofit by zipcode
    6. Search nonprofits by cause
    7. Get website info by EIN
    8. Join the Volunteer Database
    9. EXIT"

    input = gets.downcase.strip
    case input
    when '1'
      print_all
    when '2'
      print_eins
    when '3'
      print_eins
      puts "Please enter an ein number"
      ein = gets.strip
      puts " You chose: #{ein} "
      org_by_ein(ein)
      puts ""
    when '4'
      print_cities
      puts "Please enter a city from the above list"
      city= gets.strip
      puts " You chose: #{city} "
      print_org_by_city(city)
      puts ""
    when '5'
      available_zipcodes
      puts "Please enter an 8 digit zipcode in NYS, from the list above"
      zipcode = gets.chomp
      puts " You chose: #{zipcode} "
      find_by_zipcode(zipcode)
      puts ""
    when '6'
      puts ""
      print_causes
      puts ""
      puts "Please enter a cause from the above list"
      category = gets.chomp
      puts " You chose: #{category} "
      print_org_by_cause(category)
      puts ""
    when '7'
      print_eins
      puts "Please enter an EIN from the list above"
      ein=""
      ein = gets.strip
      puts " You chose: #{ein} "
      get_url_by_ein(ein)
      puts ""
    when '8'
      puts "Please enter your first name"
      first_name = gets.chomp
      puts "Please enter your last name"
      last_name = gets.chomp
      puts "Please enter your age"
      age = gets.chomp
      add_volunteer(first_name,last_name, age)
    when '9'
      break
    else
      puts "Please make a selection from the list provided."
    end
  end
end

 # binding.pry
