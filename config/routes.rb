Rails.application.routes.draw do
  root to: 'pokemons#index'
  resources :pokemons
  resources :attacks
  resources :berries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
