class CreateBankParkingPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_parking_payments do |t|
      t.string :number_plate
      t.decimal :amount
      t.string :posting_date

      t.timestamps
    end
  end
end
