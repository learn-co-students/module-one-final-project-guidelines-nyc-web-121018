class AddTagToUserReps < ActiveRecord::Migration[4.2]
  def change
    add_column :user_reps, :tag, :string
  end
end ## <<-- end of AddTagToUserReps class
