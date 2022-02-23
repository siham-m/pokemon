class CreateBerries < ActiveRecord::Migration[7.0]
  def change
    create_table :berries do |t|
      t.text :name, null: false, unique: true

      t.timestamps
    end
  end
end
