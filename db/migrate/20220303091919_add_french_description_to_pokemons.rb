class AddFrenchDescriptionToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :french_description, :text
  end
end
