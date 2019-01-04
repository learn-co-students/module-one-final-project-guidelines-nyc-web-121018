class CreateVotes < ActiveRecord::Migration[4.2]
  def change
    create_table :votes do |t|
      t.integer :bill_id
      t.integer :representative_id
      ## present or not present
      ## yea or nay vote
        ## this is tough, because it means every vote in the join table
        ## will have to be initialized with a call to the
    end
  end

end ## <<-- end of Vote class
