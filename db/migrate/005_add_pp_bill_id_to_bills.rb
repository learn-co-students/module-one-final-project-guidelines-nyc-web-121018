class AddPpBillIdToBills < ActiveRecord::Migration[4.2]
  def change
    add_column :bills, :pp_bill_id, :string
  end

end ## << --end of AddPpBillIdToBills class
