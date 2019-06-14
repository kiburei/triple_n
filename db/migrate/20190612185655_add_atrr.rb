class AddAtrr < ActiveRecord::Migration[5.1]
  def change
    add_column :bank_payments, :cleared_running_balance, :decimal
    add_column :bank_payments, :book_balance, :decimal
  end
end
