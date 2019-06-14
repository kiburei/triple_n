class ChangeDataTypeAmount < ActiveRecord::Migration[5.1]
  def change
    change_column :bank_payments, :amount, :decimal
  end
end
