Rails.application.routes.draw do
  resources :users
  resources :emails
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'emails/send_email', to: 'emails#send_email'

  # Defines the root path route ("/")
  root "users#index"
end
