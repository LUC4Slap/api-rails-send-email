Rails.application.routes.draw do
  resources :users
  resources :emails
  
  post 'emails/send_email', to: 'emails#send_email'
  get 'not_sent/all', to: 'emails#get_emails_not_sent', as: 'not_sent'
  
  post "users/login", to: "users#login", as: 'login'

  # Defines the root path route ("/")
  root "users#index"
end
