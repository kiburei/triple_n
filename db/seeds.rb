# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

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

puts "Imported #{BankPayment.count} transactions"
