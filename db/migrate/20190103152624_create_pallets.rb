class CreatePallets < ActiveRecord::Migration[5.0]
  def change
    create_table :pallets do |t| #FOR TABLE
      #id primary key
      t.string :color1
      t.string :color2
      t.string :color3
      t.string :color4
      t.integer :user_id #forigen key to user
    end
  end
end
