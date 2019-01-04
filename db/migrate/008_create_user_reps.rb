class CreateUserReps < ActiveRecord::Migration[4.2]
  def change
    create_table :user_reps do |t|
      t.integer :user_id
      t.integer :representative_id
    end
  end
end ## <<-- end of CreateUserReps class
