class CreateLaifomsBills < ActiveRecord::Migration[5.1]
  def change
    create_table :laifoms_bills do |t|
      t.string :bill_number
      t.string :date_issued
      t.string :client_name
      t.string :brief_description
      t.string :bill_status
      t.string :date_paid
      t.string :account_number
      t.decimal :detail_amount

      t.timestamps
    end
  end
end
