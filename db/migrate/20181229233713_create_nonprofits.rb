class CreateNonprofits < ActiveRecord::Migration[5.0]
  def change
    create_table :nonprofits do |t|
      t.string :charityName
      t.string :city
      t.string :url
      t.integer :ein
      t.integer :zipcode
    end
  end
end
