Rails.application.routes.draw do
  root to: 'party_calculator#index'

  get 'calculate', to: 'party_calculator#index'
  post 'calculate', to: 'party_calculator#index'
end
