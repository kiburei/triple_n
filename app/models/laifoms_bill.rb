class LaifomsBill < ApplicationRecord

  def self.paid_in_bank
    LaifomsBill.all.each do |bill|
      if BankPayment.exists?(["narration LIKE ?", "%#{bill.client_name}%"])
        puts "Bill #{bill.bill_number} exists!!"
        LaifomsBill.where(client_name: bill.client_name).update(bank_narrative: bill.client_name)
      end
    end
  end

end
