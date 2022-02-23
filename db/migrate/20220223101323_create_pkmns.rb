class CreatePkmns < ActiveRecord::Migration[7.0]
  def change
    create_table :pkmns do |t|
      t.text :name, null: false, unique: true
      t.integer :height, null: false
      t.integer :weight, null: false

      t.timestamps
    end
  end
end
