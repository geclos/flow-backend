Core::Engine.routes.draw do
  resources :users, only: [:index]
  resources :employees do
    collection do
      post :bulk_create
    end
  end
end
