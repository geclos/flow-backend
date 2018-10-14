Public::Engine.routes.draw do
  root to: "home#index"

  post 'create_signup', to: 'onboarding#create_signup', as: 'create_signup'
  get 'confirm', to: 'onboarding#confirm', as: 'confirm'

  get 'confirm_signup/:token', to: 'onboarding#confirm_signup', as: 'confirm_signup'
  post 'confirm_signup/:token', to: 'onboarding#finalize_signup', as: 'finalize_signup'
  get 'finalized/:token', to: 'onboarding#finalized', as: 'finalized'

  get 'login', to: 'sessions#new', as: 'login'

  resources :sessions
end
