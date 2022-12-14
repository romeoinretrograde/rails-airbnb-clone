Rails.application.routes.draw do
  root to: "pages#home", as: "home"
  get "/dashboard", to: "pages#dashboard"
  resources :pigs do
    resources :bookings, only: [ :index, :new, :create, :destroy ]
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
