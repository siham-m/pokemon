class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.text :name, null: false, unique: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
