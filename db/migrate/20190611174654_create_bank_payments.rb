class CreateBankPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_payments do |t|
      t.string :narration
      t.string :posting_date
      t.string :amount

      t.timestamps
    end
  end
end
