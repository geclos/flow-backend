Core::Engine.routes.draw do
  resources :campaign_members, only: [:index]
  resources :campaigns, only: [:index] do
    collection do
      post :start
    end

    member do
      post :add_employees
    end
  end
  resources :employees, only: [:index]
  resources :users, only: [:index]
end
