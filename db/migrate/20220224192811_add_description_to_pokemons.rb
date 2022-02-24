class AddDescriptionToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :description, :text, null: false
  end
end
