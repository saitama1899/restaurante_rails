class RestaurantePlatosController < ApplicationController
    def new
        @restaurante_plato = RestaurantePlato.new
    end

    # Listado de todos los restaurante_platos
    def index
        @restaurante_platos = RestaurantePlato.all
    end
    # Presentamos el FORMULARIO PARA UN INSERT

    # Recogemos los datos PARA EL INSERT a partir del NEW
    def create
        # .permit Hay que indicar los parametros permitidos (se recomienda hacer en el modelo)
        puts "llego" 
        @restaurante_plato = RestaurantePlato.new(restaurante_plato_params)
        if @restaurante_plato.save
            # redirect_to @restaurante_plato # Te muestra el restaurante_plato recien creada
            redirect_to platos_path 
        else
            redirect_to new_restaurante_plato_path
        end
    end

    # Editar restaurante_platos EDIT
    def edit
        @restaurante_plato = RestaurantePlato.find(params[:id])
    end

    def update
        @restaurante_plato = RestaurantePlato.find(params[:id])
        @restaurante_plato.update(restaurante_plato_params)
        redirect_to @restaurante_plato
    end

    def destroy 
        @restaurante_plato = RestaurantePlato.find(params[:id])
        @restaurante_plato.destroy
        redirect_to restaurante_platos_path
    end
    
    private 
    def restaurante_plato_params # Para definir los parametros que necesita
        params.require(:restaurante_plato).permit(:id_restaurante, :id_plato)
        puts params
    end
end
