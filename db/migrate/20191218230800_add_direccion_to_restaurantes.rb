class AddDireccionToRestaurantes < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurantes, :direccion, :string
  end
end
