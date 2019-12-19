class PlatosController < ApplicationController
    def new
        @plato = Plato.new
    end

    # Listado de todas los platos
    def index
        @platos = Plato.all
    end
    # Presentamos el FORMULARIO PARA UN INSERT

    # Recogemos los datos PARA EL INSERT a partir del NEW
    def create
        # .permit Hay que indicar los parametros permitidos (se recomienda hacer en el modelo)
        @plato = Plato.new(plato_params) 
        if @plato.save
            redirect_to @plato # Te muestra el plato recien creada
        else
            redirect_to new_plato_path
        end
    end

    # Muestra un plato
    def show
        @plato = Plato.find(params[:id]) 
    end

    # Editar platos EDIT
    def edit
        @plato = Plato.find(params[:id])
    end

    def update
        @plato = Plato.find(params[:id])
        @plato.update(plato_params)
        redirect_to @plato
    end

    def destroy 
        @plato = Plato.find(params[:id])
        @plato.destroy
        redirect_to platos_path
    end
    
    private 
    def plato_params # Para definir los parametros que necesita
        params.require(:plato).permit(:titulo, :descripcion, :precio, :created_at)
    end
end
