Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  resources :patients
  resources :doctors do
    collection do
      get :patients_vs_days_graph
    end
  end

  resources :demo_logins do
    collection do
      post :doctor_demo_login
      post :receptionist_demo_login
    end
  end
end
