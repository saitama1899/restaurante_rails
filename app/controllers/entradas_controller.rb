class EntradasController < ApplicationController
    
    # Presentamos el FORMULARIO PARA UN INSERT
    def new
        @entrada = Entrada.new
    end

    # Recogemos los datos PARA EL INSERT a partir del NEW
    def create
        # .permit Hay que indicar los parametros permitidos (se recomienda hacer en el modelo)
        @entrada = Entrada.new(entrada_params) 
        if @entrada.save
            redirect_to @entrada # Te muestra la entrada recien creada
        else
            redirect_to new_entrada_path
        end
    end

    # Muestra una entrada
    def show
        @entrada = Entrada.find(params[:id]) 
    end
    # Listado de todas las entradas
    def index
        @entradas = Entrada.all
    end

    # Editar entradas EDIT
    def edit
        @entrada = Entrada.find(params[:id])
    end

    def update
        @entrada = Entrada.find(params[:id])
        @entrada.update(entrada_params)
        redirect_to @entrada
    end

    def destroy 
        @entrada = Entrada.find(params[:id])
        @entrada.destroy
        redirect_to entradas_path
    end

    private 
    def entrada_params # Para definir los parametros que necesita
        params.require(:entrada).permit(:titulo, :texto)
    end
end
