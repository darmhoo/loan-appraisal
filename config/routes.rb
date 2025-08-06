  Rails.application.routes.draw do
    devise_for :users

    resources :loan_applications do
      resources :loan_application_wizard, only: [:show, :update]
    end

    root "loan_applications#index"
    get "/apply", to: "loan_applications#start", as: "start_loan_application"



  end
