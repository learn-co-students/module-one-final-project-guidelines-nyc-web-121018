class CreateVolunteerOpportunities < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteer_opportunities do |t|
      t.integer :nonprofit_id
      t.integer :volunteer_id
    end
  end
end
