Rails.application.routes.draw do
  get '/', to: "users#new"
  get '/auth/soundcloud', to: "sessions#new", as: :soundcloud_login
  get '/auth/soundcloud/callback', to: "sessions#create"
end
