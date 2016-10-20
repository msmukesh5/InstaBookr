Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'

  get '/shops/index', to: 'shops#index'

  get '/shops/services', to: 'shops#services'

  get 'users/registration/edit', to: 'devise/registrations#edit'





  
  

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
