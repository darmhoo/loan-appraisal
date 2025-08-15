Rails.application.routes.draw do
  resources :roles
  devise_for :users
  
  root "loan_applications#index"  # 👈 This makes Customers#index your root page

  resources :customers, only: [:index, :destroy, :show]

  resources :loan_applications, only: [:index, :destroy] do
  member do
    get 'wizard/:step', to: 'loan_applications#wizard', as: 'wizard'
  end

  collection do
    get 'start', to: 'loan_applications#start'
  end
end
  resources :loan_application_wizard, only: [:show, :update] do
    delete :destroy, on: :collection
  end

end
