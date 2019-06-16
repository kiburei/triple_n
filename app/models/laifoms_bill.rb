class LaifomsBill < ApplicationRecord

  def self.import_bills
    csv_text = File.read(Rails.root.join("lib", "seeds", "Misc_Bills.csv"))
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

  end

  def self.paid_in_bank
    LaifomsBill.all.each do |bill|
      if BankPayment.exists?(["narration LIKE ?", "%#{bill.client_name}%"])
        puts "Bill #{bill.bill_number} exists!!"
        LaifomsBill.where(client_name: bill.client_name).update(bank_narrative: bill.client_name)
      end
    end
  end

  def self.paid_in_revenuesure
    LaifomsBill.all.each do |bill|
      if RevenueSureBill.exists?(["client_name LIKE ?", bill.client_name])
        LaifomsBill.where(client_name: bill.client_name).update(paid_in_revenuesure: "TRUE")
        puts "Bill #{bill.bill_number} found"
      end
    end
  end

end
