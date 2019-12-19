class CreateRegistroAccions < ActiveRecord::Migration[6.0]
  def change
    create_table :registro_accions do |t|
      t.string :tabla_usada
      t.string :tipo_accion
      t.datetime :fecha_accion

      t.timestamps
    end
  end
end
