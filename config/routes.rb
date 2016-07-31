Rails.application.routes.draw do

  get 'about', to: 'static_pages#about'

  root "comics#show"
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  resources :users do
    resources :comics, except: [:index, :show]
  end
  resources :comics, only: [:index, :show]
  resources :favorite_comics, only: [:create, :destroy]
end
