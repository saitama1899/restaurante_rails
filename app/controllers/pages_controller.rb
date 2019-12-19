class PagesController < ApplicationController
    #layout "pagesLayout"
    def home
       @subtitulo = "Subtitulo"
    #    @platos = [
    #         Platos.new("Kebab", "kebab.jpg", "Descripcion"),
    #         Platos.new("Kebab", "kebab.jpg", "Descripcion"),
    #         Platos.new("Kebab", "kebab.jpg", "Descripcion")
    #     ]
    end

    def tiendas
        @tienda=params[:nombre]
        @tiendas=["Tienda BCN", "Tienda Madrid"]
    end

    def nosotros
    end

    def contactar
    end

end
