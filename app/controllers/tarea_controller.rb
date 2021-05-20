class TareaController < ApplicationController

    def index
        @tareas = Tarea.all

    end
    def create

        if(params.permit(:item).empty?)
            Tarea.create(nombre: params[:nombre], item:'secondary' )
            tareas =  params[:nombre]
            item = 'secondary'
        else
           Tarea.create(params.permit(:nombre,:item))
           tareas =  params[:nombre]
           item = params[:item]
        end
        Log.create(name:'tareas',action:'guardar',description: 'La tarea "' + tareas + '" con ítem: ' + item +' fue creada.')
    #    render plain: params.permit(:item, :nombre)


       redirect_to Tarea
    end
    def edit
        @tarea = Tarea.find params[:id]
    end

    def update

        @tarea = Tarea.find params[:id]
        tarea_anterior = @tarea.nombre
        item_anterior = @tarea.item
        @tarea .update(params.permit(:nombre,:item))
        item = params[:item]
        
        Log.create(name:'tareas',action:'guardar',description: 'La tarea se editó de "' + tarea_anterior + ' a '+ @tarea.nombre +
        '" con ítem: ' + item )
    #    render plain: params.permit(:item, :nombre)
    
        redirect_to Tarea
    end
    
         

        
        
    def destroy
        @tarea = Tarea.find params[:id]
        
        @tarea.destroy

        Log.create(name:'tareas',action:'guardar',description: 'La tarea "' +  @tarea.nombre + '"  fue eliminado.')
        redirect_to Tarea
    end

    private
        def set_tarea
        @tarea = Tarea.find(params[:id])
        end
end
