Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 get 'tareas', to: 'tarea#index'
 post 'tareas', to: 'tarea#create'

 resources :tarea, only: [:destroy,:edit,:update]
end
