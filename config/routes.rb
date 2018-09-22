Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  mount Core::Engine, at: '/', as: 'core'
  mount Notifications::Engine, at: '/', as: 'notifications'
  mount Public::Engine, at: '/', as: 'public'

  root to: Public::Engine
end
