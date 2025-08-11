Rails.application.routes.draw do
  resources :roles
  devise_for :users
  
  root "customers#index"  # 👈 This makes Customers#index your root page

  resources :customers, only: [:index, :destroy, :show]
  resources :loan_applications, only: [:index] do
    get 'start', on: :collection
  end
  resources :loan_application_wizard, only: [:show, :update]
end
