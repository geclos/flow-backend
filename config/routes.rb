Rails.application.routes.draw do
  devise_for :users

  mount Core::Engine, at: '/', as: 'core'
  mount Notifications::Engine, at: '/', as: 'notifications'
  mount Public::Engine, at: '/', as: 'public'

  root to: Public::Engine
end
