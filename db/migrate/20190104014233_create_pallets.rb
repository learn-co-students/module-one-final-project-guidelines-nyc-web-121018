class CreatePallets < ActiveRecord::Migration[5.0]
  def change
    create_table :pallets do |t| #FOR TABLE
      #id primary key
      t.string :input_color
      t.string :analogous_warm
      t.string :analogous_cool
      t.string :complementary
    end
  end
end

#for each color created by the pallet
#find its color_id
#class color.each do |instance|
# => instance.hex == :analogous_warm
# => return instance.id
