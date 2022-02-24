class AddPictureToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :picture, :text, null: false
  end
end
