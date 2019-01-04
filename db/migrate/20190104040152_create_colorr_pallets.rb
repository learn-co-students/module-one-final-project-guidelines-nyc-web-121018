class CreateColorrPallets < ActiveRecord::Migration[5.0]
  def change
    create_table :colorr_pallets do |t| #FOR TABLE
      #id primary key
      t.integer :colorr_id #forigen key to colorr
      t.integer :pallet_id #forigen key to pallet
    end
  end
end
