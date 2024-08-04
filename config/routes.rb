Rails.application.routes.draw do
  resources :products
  resources :users
  resources :sellers
  get 'dialogs/welcome'
  get 'dialogs/first_meet'
  get 'dialogs/after_first_meet'
  get 'dialogs/ask_about_age'
  get 'dialogs/after_ask_about_age'
  get 'dialogs/date_info'
  
  get 'welcome/start'
  post 'welcome/start'
  delete 'logout', to: 'welcome#destroy'


  root to: 'welcome#start'
  match '*path', to: 'welcome#start', via: :all

end
