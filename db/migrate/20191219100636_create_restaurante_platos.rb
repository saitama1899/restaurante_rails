class CreateRestaurantePlatos < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurante_platos do |t|
      t.integer :id_restaurante
      t.integer :id_plato

      t.timestamps
    end
  end
end
