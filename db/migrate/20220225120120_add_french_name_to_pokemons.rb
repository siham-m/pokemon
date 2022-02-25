class AddFrenchNameToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :french_name, :text, null: false, unique: true
  end
end
