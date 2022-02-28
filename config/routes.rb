Rails.application.routes.draw do
  root to: 'pokemons#search'
  resources :pokemons do
    collection do
      match :search, via: [:get, :post]
    end
  end
  resources :attacks
  resources :berries
  resources :imports
  resources :cards
  resources :users
  resources :sessions
  namespace :api do
    resources :berries
    resources :attacks
    resources :pokemons
  end

  get "locale", to: "application#set_locale", as: :set_locale

end
