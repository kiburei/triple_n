class CreateRevenueSureBills < ActiveRecord::Migration[5.1]
  def change
    create_table :revenue_sure_bills do |t|
      t.string :revenue_stream_code
      t.string :bill_number
      t.string :receipt_number
      t.string :transaction_type
      t.decimal :bill_amount
      t.string :transaction_code
      t.string :identifier
      t.string :client_name

      t.timestamps
    end
  end
end
