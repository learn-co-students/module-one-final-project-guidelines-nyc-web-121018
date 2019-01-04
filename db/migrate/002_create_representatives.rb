class CreateRepresentatives < ActiveRecord::Migration[4.2]

def change
  create_table :representatives do |t|
    t.string  :pp_id
    ## pp_id = "Pro Publica ID" which will be the best way to search the API
    ##          for a representative whose name etc we already have in the db
    t.string  :first_name
    t.string  :last_name
    t.string  :party
    t.boolean :in_office
    t.string  :state
    t.float   :votes_with_party_pct
    t.timestamps
  end
end

end ## <<-- end of CreateRepresentatives class
