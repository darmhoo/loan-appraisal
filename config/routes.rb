Rails.application.routes.draw do
  devise_for :users
  # root 'loan_applications#index'

  resources :loan_applications, only: [:index, :show, :destroy, :new] do
    member do
      get 'resume' => 'loan_application_steps#show', step: :determine_step
    end
  end

  # wizard steps under a separate namespace
  resources :loan_application_steps, only: [:index, :show, :update], path: 'loan_app_steps'

  # ✅ Dashboard route
  root "dashboard#index", as: :dashboard

end
