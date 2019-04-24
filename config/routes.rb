Rails.application.routes.draw do
  devise_for :users
  root 'structures#index'
  resources :structures, only: [:index, :show]
  resources :structure_relations, only: [:index]
  resources :parent_child_relations, only: [:index]
  resources :references, only: [:index, :show]
  resources :individuals, only: [:index, :show]

  namespace :admin do 
	  resources :structures
	  resources :structure_types, only: [:create, :new, :edit, :update, :destroy]
	  resources :structure_classifications, only: [:new, :create, :edit, :update, :destroy]
	  resources :structure_relations, only: [:index, :create, :new, :destroy]
	  resources :parent_child_relations, only: [:index, :new, :create, :destroy]
	  resources :references
    resources :reference_classes, only: [:new, :create, :edit, :update, :destroy]
	  resources :individuals
    resources :partners, only: [:new, :create, :edit, :update, :destroy]
  end
end
