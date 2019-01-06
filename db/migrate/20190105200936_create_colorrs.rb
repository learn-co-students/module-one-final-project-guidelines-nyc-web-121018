class CreateColorrs < ActiveRecord::Migration[5.0]
  def change
    create_table :colorrs do |t|
      #id primary key
      t.string :hexvalue
      t.string :name
    end
  end
end
