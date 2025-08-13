Rails.application.routes.draw do
  devise_for :users
  
  root "customers#index"  

  resources :customers, only: [:index, :destroy]

  resources :loan_applications, only: [:index] do
    get 'start', on: :collection
  end

  # resources :loan_application_wizard, only: [:show, :update, :destroy]
  
  # config/routes.rb
  resources :loan_application_wizard, only: [:show, :update] do
    delete :destroy, on: :collection
  end



end
