class AddTituloToRestaurantes < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurantes, :titulo, :string
  end
end
