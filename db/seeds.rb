# puts "making passengers"
# 100.times do
#   Passenger.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: (0..100).to_a.sample)
# end
# puts "makde"

def update_house
  get_rep_from_api["results"][0]["members"].each do |rep|
    Representative.create(
      pp_id: rep["id"],
      first_name: rep["first_name"],
      last_name: rep["last_name"],
      party: rep["party"],
      in_office: rep["in_office"],
      state: rep["state"],
      votes_with_party_pct: rep["votes_with_party_pct"],
      district: rep["district"]
    )
  end
end

# get_rep_from_api["results"][0]["members"].size = 456

def update_senate
  get_sen_from_api["results"][0]["members"].each do |rep|
    Representative.create(
      pp_id: rep["id"],
      first_name: rep["first_name"],
      last_name: rep["last_name"],
      party: rep["party"],
      in_office: rep["in_office"],
      state: rep["state"],
      votes_with_party_pct: rep["votes_with_party_pct"],
    )
  end
end

def update_recent_house_bills
  get_house_bills_from_api["results"][0]["bills"].each do |bill|
    Bill.create(
      title: bill["title"],
      number: bill["number"],
      sponsor_name: bill["sponsor_name"],
      sponsor_state: bill["sponsor_state"],
      sponsor_party: bill["sponsor_party"],
      sponsor_id: bill["sponsor_id"],
      introduced_date: bill["introduced_date"],
      repub_cosponsors: bill["cosponsors_by_party"]["R"],
      dem_cosponsors: bill["cosponsors_by_party"]["D"],
      pp_bill_id: bill["bill_id"]
      )
  end
end

def update_all_votes
  ## getting "a specific member's vote positions"
  ## for each member
    ## so, members.each by pp_id
    ## check votes
    ## match where pp_bill_id matches?
  Representative.all.each do |rep|
    get_member_votes_from_api(rep["pp_id"])["results"][0]["votes"].each do |vote|
    #  binding.pry
      next if get_specific_bill_from_api(vote["bill"]["bill_id"])["results"] == nil
      if !Bill.find_by(pp_bill_id: vote["bill"]["bill_id"])
        # if the bill in question is not in the database, put it in
        bill = get_specific_bill_from_api(vote["bill"]["bill_id"])["results"][0]
        Bill.create(
          title: bill["title"],
          number: bill["number"],
          sponsor_name: bill["sponsor"],
          sponsor_state: bill["sponsor_state"],
          sponsor_party: bill["sponsor_party"],
          sponsor_id: bill["sponsor_id"],
          introduced_date: bill["introduced_date"],
          repub_cosponsors: bill["cosponsors_by_party"]["R"],
          dem_cosponsors: bill["cosponsors_by_party"]["D"],
          pp_bill_id: bill["bill_id"]
          )
      end#if
      # then create a vote relationship between the new or existing bill and the representative
      Vote.create(
        bill_id: Bill.find_by(pp_bill_id: vote["bill"]["bill_id"]).id,
        representative_id: Representative.find_by(pp_id: rep["pp_id"]).id,
        pp_id: vote["member_id"],
        pp_bill_id: vote["bill"]["bill_id"],
        position: vote["position"],
        result: vote["result"],
        date: vote["date"],
        time: vote["time"]
      )

    end#do
  end#do
end#def
        ## this sort of works, but it does 78,000+ entries
        ## and that's not going to fly.
        ## so let's do it another way
#
# def update_recent_votes
#   get_house_votes_from_api["results"]["votes"].each do |vote|
#     Representative.all.each


puts "deleting..."
Representative.delete_all
Bill.delete_all
Vote.delete_all
#destroy_bills
puts "all destroyed"
puts "updating..."
puts "updating congressmembers..."
update_house
#puts "updating senators..."
#update_senate
puts "all reps updated!"
puts "updating recent House bills..."
sleep(0.5)
update_recent_house_bills
puts "bills updated!"
puts "updating votes..."
puts "this one takes a while..."
update_all_votes
puts "votes updated!"
