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

# def welcome
#   "Welcome to Nonprofit Matcher, what cause are you passionate about?"
#   puts welcome
# end

category = gets.chomp

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

######################################

def list(eins)
  eins.each_with_index do |ein, i|
    puts "#{i+1}. #{ein}"
  end
end

  input =""
  while input
    puts "Welcome to Nonprofit Matcher, please make a selection:
    1. Find organization by EIN
    2. Get cause by EIN #
    3. EXIT"
    input = gets.downcase.strip
    case input
    when '1'
      list(eins)
    when '2'
      print_org_info
    when '3'
      break
    else
      "Please make a selection."
    end
  end






  # puts "the user entered #{category}"

#
# print_by_org_name(name)
