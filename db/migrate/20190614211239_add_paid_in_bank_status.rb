class AddPaidInBankStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :laifoms_bills, :bank_narrative, :string
  end
end
