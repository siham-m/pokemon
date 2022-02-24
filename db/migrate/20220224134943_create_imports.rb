class CreateImports < ActiveRecord::Migration[7.0]
  def change
    create_table :imports do |t|
      t.text :resource, null: false
      t.timestamps
    end
  end
end
