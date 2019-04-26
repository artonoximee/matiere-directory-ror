Rails.application.routes.draw do
  devise_for :users
  root 'structures#index'
  resources :structures, only: [:index, :show]
  resources :references, only: [:index, :show]
  resources :individuals, only: [:index, :show]
  resources :projects, only: [:index, :show]
  get '/map_structures', to: 'structures#map'
  get '/map_projects', to: 'projects#map'
  get '/global_map', to: 'maps#global'
  resources :partners, only: [:index]
  get '/about', to: 'statics#about'

  namespace :admin do 
	  resources :structures
	  resources :structure_types, only: [:create, :new, :edit, :update, :destroy]
	  resources :structure_classifications, only: [:new, :create, :edit, :update, :destroy]
	  resources :structure_relations, only: [:create, :new, :destroy]
	  resources :parent_child_relations, only: [:new, :create, :destroy]
	  resources :references
    resources :reference_classes, only: [:new, :create, :edit, :update, :destroy]
	  resources :individuals
    resources :partners, only: [:new, :create, :edit, :update, :destroy]
    resources :structure_partners, only: [:new, :create, :destroy]
    resources :projects
    resources :project_classes, only: [:new, :create, :edit, :update, :destroy]
    resources :project_project_classes, only: [:create, :destroy]
    resources :partner_projects, only: [:create, :destroy]
    resources :structure_projects, only: [:create, :destroy]
  end
end