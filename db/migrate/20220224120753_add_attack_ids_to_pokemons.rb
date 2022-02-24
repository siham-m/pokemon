class AddAttackIdsToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :attack_names, :text, array: true, default: [] 
  end
end
