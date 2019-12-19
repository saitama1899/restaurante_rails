class ApplicationController < ActionController::Base

    attr_reader :platos

    def initialize 
        @tiendas = ["Tienda BCN", "Tienda Madrid"]
        @restaurantes = Restaurante.all
        super
    end
end
