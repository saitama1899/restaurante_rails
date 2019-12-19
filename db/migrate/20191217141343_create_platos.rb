class CreatePlatos < ActiveRecord::Migration[6.0]
  def change
    create_table :platos do |t|
      t.string :titulo
      t.text :descripcion
      t.numeric :precio

      t.timestamps
    end
  end
end
