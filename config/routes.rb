Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  resources :customer_infos

  resources :loan_applications do
    resources :wizard, controller: 'loan_application_wizard', only: [:show, :update]
  end


  post '/start_loan', to: 'loan_applications#start', as: :start_loan
  root to: "home#index"

end
