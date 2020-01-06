class CreateRestaurantePlatos < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurante_platos do |t|
      t.references :restaurante, null: false, foreign_key: true
      t.references :plato, null: false, foreign_key: true

      t.timestamps
    end
  end
end
