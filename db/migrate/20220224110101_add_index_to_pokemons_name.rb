class AddIndexToPokemonsName < ActiveRecord::Migration[7.0]
  def change
    add_index :pokemons, :name
  end
end
