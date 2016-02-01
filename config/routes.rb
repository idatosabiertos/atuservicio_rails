Rails.application.routes.draw do
  match '/(departamento/:departamento)' => 'home#index', via: :get

  get '/comparar' => 'compare#index'
  get '/comparar/:selected_providers' => 'compare#index', as: :compare
  get '/agregar' => 'compare#add'

  resources :providers do
    get :autocomplete_provider_search_name, on: :collection
  end

  get '/sobre_el_proyecto' => 'home#sobre_el_proyecto'

  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"
end
