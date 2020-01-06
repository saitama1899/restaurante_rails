class RestaurantesController < ApplicationController

        def new
            @restaurante = Restaurante.new
        end
    
        # Listado de todas los restaurantes
        def index
            @restaurantes = Restaurante.all
        end
        # Presentamos el FORMULARIO PARA UN INSERT
    
        # Recogemos los datos PARA EL INSERT a partir del NEW
        def create
            # .permit Hay que indicar los parametros permitidos (se recomienda hacer en el modelo)
            
            # puts "######################################################"
            # puts params[:restaurante][:plato_id]
            # puts "######################################################"
            # if :plato_id && :restaurante_id
            #     @restaurante=Restaurante.find(:restaurante_id)
            #     @plato=Plato.find(:plato_id)
            #     @restaurante_plato=RestaurantePlato.new
            #     @restaurante_plato.restaurante_id=@restaurante.id
            #     @restaurante_plato.plato_id= @plato.id
            #     @restaurante.restaurante_platos<<@restaurante_plato
            #     # @restaurante.restaurante_platos.push(@restaurante_plato)
            #     @restaurante.save
            # else
                @restaurante = Restaurante.new(restaurante_params) 
                if @restaurante.save
                    redirect_to @restaurante # Te muestra el restaurante recien creada
                else
                    redirect_to new_restaurante_path
                end
            # end

        end
    
        # Muestra un restaurante
        def show
            @restaurante = Restaurante.find(params[:id])
        end
    
        # Editar restaurantes EDIT
        def edit
            @restaurante = Restaurante.find(params[:id])
        end
    
        def update
            @restaurante = Restaurante.find(params[:id])
            @restaurante.update(restaurante_params)
            redirect_to @restaurante
        end
    
        def destroy 
            @restaurante = Restaurante.find(params[:id])
            @restaurante.destroy
            redirect_to restaurantes_path
        end
        
        def restaurante_plato
            @restaurante=Restaurante.find(params[:restaurante_id])
            @plato=Plato.find(params[:plato_id])
            @restaurante_plato=RestaurantePlato.new
            @restaurante_plato.restaurante_id=@restaurante.id
            @restaurante_plato.plato_id= @plato.id
            @restaurante.restaurante_platos<<@restaurante_plato
            # @restaurante.restaurante_platos.push(@restaurante_plato)
            @restaurante.save
        end

        def add_restaurante_plato
            @restaurante = Restaurante.new
        end

        private 
        def restaurante_params # Para definir los parametros que necesita
            params.require(:restaurante).permit(:titulo, :direccion, plato_ids:[])
        end
end
