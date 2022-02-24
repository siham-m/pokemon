class AddEvolvesFromToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :evolves_from, :text
  end
end
