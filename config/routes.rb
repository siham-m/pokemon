Rails.application.routes.draw do
  root to: 'pokemons#index'
  resources :pokemons do
    get :import, on: :collection
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
