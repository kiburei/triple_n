class AddPaidInRevenuesureToLaifomsBills < ActiveRecord::Migration[5.1]
  def change
    add_column :laifoms_bills, :paid_in_revenuesure, :string
  end
end
