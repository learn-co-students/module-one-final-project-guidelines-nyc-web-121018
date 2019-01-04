@cli_user = nil

### TO implement real CRUD functionality
## give users the ability to UNTRACK representatives
## adding D = destroy

## and add a column to userreps that says like "rating"
## and lets you review your rep and say you do or don't like them
## that way you can modify their tag, getting U = update



def welcome
  ## TODO: time-based greeting
  puts "  ________   ___  ______________  __     ______  ______
 / ___/ _ | / _ \\/  _/_  __/ __ \\/ /    / __/\\ \\/ / __/
/ /__/ __ |/ ___// /  / / / /_/ / /__  / _/   \\  / _/
\\___/_/ |_/_/  /___/ /_/  \\____/____/ /___/   /_/___/
                                                       "
  puts "Hello! And welcome to Capitol Eye."
  puts "We can help keep you up to date on the 116th United States Congress.\n"
end

def get_or_create_user
## Ask for username, either create or find
  puts "Please enter a new or existing username...\n"
  current_user = gets.chomp.downcase
  if User.exists?(:username => current_user)
    get_user(current_user)
  else
    create_user(current_user)
  end
  # TODO: if username exists, puts "${user} was created on ${date}, proceed?"
  # TODO: if username does not exist, puts "Proceed with new user ${user}?"
  ##
end


## "Here's how your tracked reps voted on this bill:"

def create_user(new_name)
  puts "Proceed with new user #{new_name}? [Y] or [N]\n"
  input = gets.chomp.downcase
  if input === "y" || input === "yes"
    User.create(username: new_name)
    @cli_user = User.find_by(username: new_name)
    display_status(User.find_by(username: new_name))
  elsif input === "n" || input === "no"
    get_or_create_user
  else
    puts "I'm sorry, I didn't understand that."
    create_user(new_name)
  end
end

def get_user(existing_name)
  existing_user = User.find_by(username: existing_name)
  puts "#{existing_name} was created on #{existing_user.created_at}, proceed?\n"
  input = gets.chomp.downcase
  if input === "y" || input === "yes"
    @cli_user = existing_user
    display_status(existing_user)
  elsif input === "n" || input === "no"
    get_or_create_user
  else
    puts "I'm sorry, I didn't understand that."
    get_or_create_user
  end
end

def display_status(existing_user)
## show... users reps, users bills, users issues
  puts "Hi #{existing_user.username},"
  #binding.pry
  if existing_user.representatives.any?
    puts "You're currently tracking:"
    display_tracked_reps(existing_user)
  end
  display_menu
  ## TODO display_users_reps
  ## TODO display_users_bills
  ## TODO display_users_issues
end

def display_tracked_reps(user)
  i=1
  user.representatives.each do |rep|
    puts "[#{i}] #{rep.first_name} #{rep.last_name}, #{rep.party === "D" ? "Democrat" : "Republican"} - #{rep.state} district"
    puts "#{UserRep.find_by(user_id: @cli_user.id, representative_id: rep.id).tag}"
    i+=1
  end
end

def display_menu
  puts "\n Would you like to look up a [R]epresentative? a [B]ill? \n Maybe you want to [T]ag or [U]ntrack a tracked representative? \n Or would you like to [Q]uit?" #+ "an [I]ssue?"
  input = gets.chomp.downcase
  if input.to_i > 0
    display_rep(@cli_user.representatives[input.to_i-1])
  elsif input === "r" || input === "representative"
    lookup_rep
  elsif input === "b" || input === "bill"
    lookup_bill
  # elsif input === "i" || input === "issue"
    # lookup_issue
  elsif input === "u" || input === "untrack"
    display_untrack_menu
  elsif input === "t" || input === "tag"
    display_tag_menu
  elsif input === "q" || input === "quit"
    abort("Alright bye!")
  else
    puts "Sorry, I didn't understand that"
    display_menu
  end
end

def display_untrack_menu
  if @cli_user.representatives.any?
    puts "Which rep would you like to untrack?"
    input = gets.chomp.to_i
    UserRep.delete(UserRep.where(user_id: @cli_user.id)[input-1].id)
  else
    puts "You don't have any tracked reps yet..."
  end
  display_menu
end

def display_tag_menu
  if @cli_user.representatives.any?
    puts "Which rep would you like to tag?"
    input = gets.chomp.to_i
    taggable = UserRep.where(user_id: @cli_user.id)[input-1]
    rep = Representative.where(id: UserRep.where(user_id: @cli_user.id)[input-1].representative_id)[0]
    puts "What would you like to say about Rep. #{rep.last_name}?"
    user_tag = gets.chomp
    taggable.update(tag: user_tag)
  else
    puts "You don't have any tracked reps yet..."
  end
  display_menu
end

def lookup_rep
#  chamber = get_chamber_from_user
  state = get_state_from_user
  rep_name = get_name_from_user

  representative = Representative.find_by(state: state, last_name: rep_name)
  if Representative.exists?(state: state, last_name: rep_name)
    display_rep(representative)
  elsif rep_name.blank?
    display_all_reps(state)
  else
    "Check your inputs, I'm not sure what you're looking for..."
  end
end

def track_rep(representative)
  # binding.pry
  UserRep.create(user_id: @cli_user.id, representative_id: representative.id)
end

def display_bill(bill)
  puts "#{bill[0].number} #{bill[0].title} \n Sponsored by #{bill[0].sponsor_name}, #{bill[0].sponsor_party}-#{bill[0].sponsor_state}."
  if @cli_user.representatives.any?
    @cli_user.representatives.each do |rep|
      position = Vote.find_by(pp_id: rep.pp_id, pp_bill_id: bill[0].pp_bill_id).position
      puts "#{rep.first_name} #{rep.last_name} #{rep.party} - #{rep.state} voted #{position}"
    end
  end
end

def display_recent_bills(representative)
  i = 1
  puts "Your representative recently voted:"
  representative.votes.each do |vote|
#    binding.pry
    bill = Bill.where(:id => vote.bill_id)
    puts "[#{i}] #{vote.position} on #{bill[0].number}"
    i += 1
  end
  bill_select(representative)
end

def bill_select(representative)
  bill_select = gets.chomp.to_i
#  binding.pry
  if bill_select === 0
      display_menu
  elsif bill_select <= representative.votes.size
    selected_bill = Bill.where(:id => representative.votes[bill_select-1].bill_id)
    display_bill(selected_bill)
  end
  bill_select
end

def display_rep(representative)
  #binding.pry
  puts "#{representative.first_name} #{representative.last_name} is a #{representative.party === "D" ? "Democrat" : "Republican"} who represents the Nth district of #{representative.state}"
  display_recent_bills(representative)
  if @cli_user.representatives.include?(representative)
    display_menu
  else
    puts "Would you like to add Rep. #{representative.last_name} to your tracked reps?"
    input = gets.chomp.downcase
    if input.to_i > 0
      display_bill(Bill.where(:id => representative.votes[input.to_i-1].bill_id))
      display_rep(representative)
    elsif input === "y" || input === "yes"
      track_rep(representative)
      display_menu
    elsif input === "n" || input === "no"
      puts "Alright"
      display_menu
    else
      display_rep(representative)
    end
  end
end

def display_all_reps(state)
  i = 1
  Representative.where(:state => state).each do |rep|
    puts "[#{i}] #{rep.first_name} #{rep.last_name}, #{rep.party}" # + "#{rep.district}"
    i += 1
  end
  rep_select = gets.chomp.to_i
  #binding.pry
  ## this could be refactored into a new method
  if rep_select <= Representative.where(:state => state).size
    representative = Representative.where(:state => state)[rep_select-1]
    display_rep(representative)
  else
    display_all_reps(state)
  end
end

def display_voting_reps(bill)
end

def get_chamber_from_user
  chamber = ""
  puts "[H]ouse or [S]enate?"
  chamber_input = gets.chomp.downcase
  if chamber_input === "h" || chamber_input === "house"
    chamber = "house"
  elsif chamber_input === "s" || chamber_input === "senate"
    chamber = "senate"
  else
    puts "Okay but..."
    get_chamber_from_user
  end
  chamber
end

def get_state_from_user
  puts "What state? Please use the two-letter abbreviation."
  ## so and so is the representative for such and such a district
  state_input = gets.chomp.upcase
  if state_input.length > 2
    puts "Just use the two-letter abbreviation for your state, please."
    lookup_rep
  else
    state_input
  end
  ## I would love to have all fifty abbreviations here, to check if
  ## user is passing a real state. Also I would like to have support for
  ## full state names. Currently it assumes all two-character strings are
  ## real states.
end

def get_name_from_user
  puts "What's the member's last name? If you're not sure, leave it blank——we'll show you all the reps from your state."
  name_input = gets.chomp.downcase
  if name_input.include?(" ")
    puts "Hey we can only handle last names right now"
    get_name_from_user
  else
    name_input.capitalize
  end
end

def get_bill_number_from_user
  puts "What's the number of the bill you're looking for?"
  bill_input = gets.chomp.downcase.gsub(/\W/,"")
  lookup_bill_by_number(bill_input)
end

def lookup_bill
  bill_number = get_bill_number_from_user
  # sponsor = get_sponsor_from_user
  bill = Bill.find_by(number: "#{bill_number}-115")
  if Bill.exists?(number: "#{bill_number}-115")
    display_bill(bill)
  else
    "Check your inputs, I'm not sure what you're looking for..."
  end

  #
  # state = get_state_from_user
  # rep_name = get_name_from_user
  #
  # representative = Representative.find_by(state: state, last_name: rep_name)
  # if Representative.exists?(state: state, last_name: rep_name)
  #   display_rep(representative)
  # elsif rep_name.blank?
  #   display_all_reps(state)
  # else
  #   "Check your inputs, I'm not sure what you're looking for..."
  # end





  ## by topic, title, number?
  ## or, bills to be voted on soon
  ## or, bills recently written?

  ## here's a bill, called
  ## here's what topics it's about, do you want to see a summary?

  ## would you like to add bill x to your tracked bills?
end

def lookup_bill_by_number(number)
  bill = Bill.where(:pp_bill_id => number+"-115")
  display_bill(bill)
  display_menu
end
#
# def get_sponsor_from_user
#
# end

#
# def lookup_bill_by_sponsor(sponsor)
#
# end

# def lookup_issue
#   ## here are the last few voted-on bills with this issue
#   ## here are the next few
#   ##
#   ## would you like to add this to your tracked issues?
# end
