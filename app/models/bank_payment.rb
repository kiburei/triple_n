class BankPayment < ApplicationRecord

  def self.update_narration
    BankPayment.all.each do |v|
      n = v.narration.split
      2.times do
        n.delete_at(0)
      end
      v.update(narration: n.join)
    end
  end

  def self.get_number_plates
    # fetch exclusive number plates
    BankPayment.all.each do |v|
      if v.narration.size == 7
        if v.narration.gsub(/\d/).count == 3
          BankParkingPayment.create!(number_plate: v.narration, amount: v.amount, posting_date: v.posting_date)
        end
      end
    end
    puts "#{BankParkingPayment.count} parking transactions paid at bank"
  end

end
