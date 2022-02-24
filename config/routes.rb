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
end
