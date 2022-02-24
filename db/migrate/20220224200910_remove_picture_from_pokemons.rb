class RemovePictureFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :picture
  end
end
