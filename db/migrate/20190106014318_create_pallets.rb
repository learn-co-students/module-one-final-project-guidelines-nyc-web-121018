class CreatePallets < ActiveRecord::Migration[5.0]
  def change
    create_table :pallets do |t| #FOR TABLE
      #id primary key
      t.string :origin_color
      t.string :analogous_warm
      t.string :analogous_cool
      t.string :complementary
    end
  end
end
