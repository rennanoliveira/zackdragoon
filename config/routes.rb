Rails.application.routes.draw do
  root to: 'party_calculator#index'
  post 'calculate', to: :create, controller: 'party_calculator'
end
