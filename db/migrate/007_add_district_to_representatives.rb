class AddDistrictToRepresentatives < ActiveRecord::Migration[4.2]
  def change
    add_column :representatives, :district, :string
  end
end ## <<-- end of AddDistrictToRepresentatives class
