class AddColumnsToVotes < ActiveRecord::Migration[4.2]
  def change
    add_column :votes, :pp_id, :string
    add_column :votes, :pp_bill_id, :string
    add_column :votes, :position, :string
    add_column :votes, :result, :string
    add_column :votes, :date, :string
    add_column :votes, :time, :string
  end
end ## <<-- end of AddColumnsToVotes class
