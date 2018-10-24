Core::Engine.routes.draw do
  resources :users, only: [:index]
  resources :employees
end
