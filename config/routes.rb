Rails.application.routes.draw do

  root "comics#show"
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  resources :users do
    resources :comics, only: [:create, :edit, :new, :delete, :update ]
  end
  resources :comics, only: [:index, :show]
  resources :favorite_comics, only: [:create, :destroy]
end
