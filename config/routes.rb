Rails.application.routes.draw do
  root to: 'pokemons#index'
  resources :pokemons do
    collection do
      match :search, via: [:get, :post]
    end
  end
  resources :attacks
  resources :berries
  resources :imports
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
