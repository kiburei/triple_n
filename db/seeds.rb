# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

BankPayment.destroy_all
LaifomsBill.destroy_all
RevenueSureBill.destroy_all
# Upload Bank Statement
# csv_text = File.read(Rails.root.join("lib", "seeds", "#{Date.today.to_s}nbk.csv"))
csv_text = File.read(Rails.root.join("lib", "seeds", "Cash Deposits NBK.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv[2..csv.size].each do |row|
  t = BankPayment.new
  t.narration = row['﻿NARRATION']
  t.posting_date = row['POSTINGDATE']
  t.amount = row['AMOUNT']
  t.cleared_running_balance = row['CLEAREDRUNNINGBALANCE']
  t.book_balance = row['BOOKBALANCE']

  t.save
end
# Upload LAIFOMS bill
csv_text = File.read(Rails.root.join("lib", "seeds", "laifoms.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = LaifomsBill.new
  t.bill_number = row['BillNumber']
  t.date_issued = row['DateIssued']
  t.client_name = row['ClientsName']
  t.brief_description = row['BriefDesc']
  t.bill_status = row['BillStatus']
  t.date_paid = row['DatePaid']
  t.account_number = row['AccountNumber']
  t.detail_amount = row['DetailAmount']
  t.save
end
# import revenusure bills
csv_text = File.read(Rails.root.join("lib", "seeds", "revenusurebills.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = RevenueSureBill.new
  t.revenue_stream_code = row['RevenueStreamCode']
  t.bill_number = row['BillNo']
  t.receipt_number = row['ReceiptNo']
  t.transaction_type = row['TransactionType']
  t.bill_amount = row['BillAmount']
  t.transaction_code = row['TransactionCode']
  t.identifier = row['Identifier']
  t.client_name = row['ClientName']
  t.save
end



puts "Imported #{LaifomsBill.count} Laifoms transactions"
puts "Imported #{BankPayment.count} Bank transactions"
puts "Imported #{RevenueSureBill.count} Revenusure transactions"
