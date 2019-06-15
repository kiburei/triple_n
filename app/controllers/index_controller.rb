class IndexController < ApplicationController
  def index
    @bank_transactions = BankPayment.all
    @laifoms_bills = LaifomsBill.all
    @revenusure_bills = RevenueSureBill.all
  end
end
