Rails.application.routes.draw do
  root 'public#index'

  get 'public/index'
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

	

	get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, :except => [:show] do
  	member do
  		get :delete
  	end
  end

	resources :subjects do
		member do
			get :delete
		end
	end

	resources :pages do
		member do
			get :delete
		end
	end

	resources :sections do
		member do
			get :delete
		end
	end

	get 'demo/index'
	match "demo", :to => "demo#index", :via => :get
	
	get 'demo/hello'
	get 'demo/other_hello'
	get 'demo/escape_output'

  # get 'demo/index'

	# simple route
	# short
	# get "demo/index"
	# long
	# match "demo/index", :to => "demo#index", :via => :get


	# default route (may get depricated)
	# structure :controller/:action/:id
	# short note parenthis means it is optional
	# get ':controller(/:action(/:id))'
	# long
	# match ':controller(/:action(/:id))', :via => :get

	# root route
	# long form
	# match "/", :to => "demo#index", :via => get
	# short form



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
