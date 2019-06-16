class IndexController < ApplicationController
  def index
    @bank_transactions = BankPayment.all
    @laifoms_bills = LaifomsBill.all
    @revenusure_bills = RevenueSureBill.all
  end

  def bank_transactions
    @bank_transactions = BankPayment.all
  end

  def laifoms_bills
    @laifoms_bills = LaifomsBill.all
  end

  def revenusure_bills
    @revenusure_bills = RevenueSureBill.all
  end

end
