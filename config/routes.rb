Rails.application.routes.draw do
  default_url_options protocol: :https unless Rails.env.development?

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  mount Core::Engine, at: '/', as: 'core'
  mount Notifications::Engine, at: '/', as: 'notifications'
  mount Public::Engine, at: '/', as: 'public'

  root to: Public::Engine
end
