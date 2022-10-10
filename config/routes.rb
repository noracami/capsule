Rails.application.routes.draw do
  root to: "home#index"
  devise_scope :user do
    # Redirests signing out users back to index
    get "users", to: "home#index"
  end
  devise_for :users, controllers: {
    # passwords: "users/passwords",
    # sessions: "users/sessions",
    # registrations: "users/registrations"
  }
end
