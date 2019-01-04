class CreateBills < ActiveRecord::Migration[4.2]
  def change
    create_table :bills do |t|
      # what do bills need
      # titles
      t.string :title
      t.string :number
      ## number is not useful as it is different in different parts of the API
      ## what they call "bill_id" is much more consistent and should be added
      ## in a future migration
      t.string :sponsor_name
      t.string :sponsor_state
      t.string :sponsor_party
      t.string :sponsor_id
      t.string :introduced_date
      t.integer :repub_cosponsors
      t.integer :dem_cosponsors
    end
  end

end ## <<-- end of Bill class
