class Plato < ApplicationRecord

    # has_and_belongs_to_many :restaurantes
    has_many :restaurante_platos
    has_many :restaurantes, through: :restaurante_platos

    validates :titulo, presence: true

    after_validation :censurar, :upcase_sin_espacios
    
    after_create -> { registrar_accion("Creado") }
    after_save -> {registrar_accion("Guardado") }
    after_update -> {registrar_accion("Editado") }
    after_destroy -> {registrar_accion("Borrado") }

    private
    def censurar
        palabras_censuradas = [
            "Joputa",
            "Marica"
        ]
        if palabras_censuradas.include? titulo
            self.titulo = "*" * titulo.size
        end
    end

    def upcase_sin_espacios
        self.titulo = titulo.delete(' ').upcase
    end

    def registrar_accion(accion)
        registro=RegistroAccion.new
        registro.tabla_usada = "Platos"
        registro.tipo_accion = accion
        registro.fecha_accion = self.created_at
        registro.save
    end
end
