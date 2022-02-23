class AddColumnsToAttacks < ActiveRecord::Migration[7.0]
  def change
    add_column :attacks, :accuracy, :integer, null: false
    add_column :attacks, :power, :integer, null: false
  end
end
