Rails.application.routes.draw do
  
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
end