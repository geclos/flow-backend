Core::Engine.routes.draw do
  resources :users, only: [:update, :delete]
  resources :employees
end
