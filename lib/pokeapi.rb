class PokeAPI
  def self.pokemons
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=2000')
    JSON.parse(response.body)
  end
  
end