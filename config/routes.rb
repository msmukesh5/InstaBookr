Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'

  get '/shops/index', to: 'shops#index'

  get '/shops/services', to: 'shops#services'

  get 'users/registration/edit', to: 'devise/registrations#edit'




  # api calls

  namespace :api, defaults: {format: 'json'} do
  	namespace :v1 do

  		namespace :account do
  			resources :users do
  				get 'user_details', :on => :collection
  				get 'app_data', :on => :collection
          post 'get_shops_list', :on => :collection
  			end
  		end

  	end
  end


  
  

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
