Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  root to: 'sessions#welcome'
  get 'logout' => 'sessions#destroy'
  get 'otp_validation' => 'sessions#otp_validation'
  post 'validate_with_otp', to: 'sessions#validate_with_otp'
end
