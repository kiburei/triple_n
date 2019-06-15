class LaifomsBill < ApplicationRecord

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
