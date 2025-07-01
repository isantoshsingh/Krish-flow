Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "reports/index"
  get "dashboard/index"
  root "dashboard#index"
  
  resources :people do
    member do
      get :lands_owned
      get :lands_farmed
    end
  end
  
  resources :lands do
    resources :lease_snapshots, except: [:index] do
      resources :payments, except: [:index, :show]
    end
  end
  
  resources :lease_snapshots, only: [:index, :show] do
    resources :payments, only: [:index, :show]
  end
  
  get "dashboard", to: "dashboard#index"
  get "reports", to: "reports#index"
  get "reports/export", to: "reports#export"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

