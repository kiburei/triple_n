Rails.application.routes.draw do
  root 'index#index'
  get 'index/bank_transactions'
  get 'index/laifoms_bills'
  get 'index/revenusure_bills'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
