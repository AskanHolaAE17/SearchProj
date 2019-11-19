Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'search_handlers#index'
  
  post 'match' => 'search_handlers#match'
  
  match "*path",   to: 'search_handlers#index',   via: 'get'
end
