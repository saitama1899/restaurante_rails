Rails.application.routes.draw do

  # PAGES
  root to: "platos#index"
  get "/home", to: "platos#index", as: "home" # el as: es opcional

  get "/tiendas/:nombre", to: "pages#tiendas", as: "tiendas"
  get "/tiendas", to: redirect("/tiendas/ALL")

  get "/nosotros", to: "pages#nosotros", as: "nosotros"
  get "/contactar", to: "pages#contactar", as: "contactar"

  get "/restaurantes/restaurante_plato", to: "restaurantes#add_restaurante_plato", as:"new_restaurante_plato"
  get "/restaurantes/restaurante_plato/:restaurante_id/:plato_id", to: "restaurantes#restaurante_plato", as:"restaurante_plato"
  # get "/restaurantes/restaurante_plato", to: redirect("/restaurantes/restaurante_plato/ALL")

  # ENTRADAS
  resources :entradas

  # RESTAURANTES Y PLATOS
  resources :platos
  resources :restaurantes

  resources :restaurante_platos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
