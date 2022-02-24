class AddTypeToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :types, :text, null: false, array: true, default: []
  end
end
