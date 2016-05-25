Rails.application.routes.draw do
  get '/', to: "users#new", as: :root
  get '/auth/soundcloud', to: "sessions#new", as: :soundcloud_login
  get '/auth/soundcloud/callback', to: "sessions#create"
  delete '/logout', to: "sessions#delete", as: :logout
  resources :users, only: [:new, :show]
end
