Rails.application.routes.draw do
  root to: "home#index"

  devise_scope :user do
    # Redirests signing out users back to index
    get "users", to: "home#index"
    get "/users/sign_up", to: "users/registrations#new"
  end

  devise_for :users, controllers: {
    # passwords: "users/passwords",
    # sessions: "users/sessions",
    # registrations: "users/registrations"
  }

  get '/:custom_value', to: 'links#show', constraints: { custom_value: /[0-9A-Z]{5}/ }
  get '/c/:custom_value', to: 'links#show'
  
  resources :links
end
