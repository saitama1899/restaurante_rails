class Restaurante < ApplicationRecord

    # has_and_belongs_to_many :platos
    has_many :restaurante_platos
    has_many :platos, through: :restaurante_platos

end
