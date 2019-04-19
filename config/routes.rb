Rails.application.routes.draw do
  root 'structures#index'
  resources :structures
  resources :structure_types, only: [:create, :new, :edit, :update, :destroy]
  resources :structure_classifications, only: [:new, :create, :edit, :update, :destroy]
  resources :structure_relations, only: [:index, :create, :new, :destroy]
  resources :parent_child_relations, only: [:index, :new, :create, :destroy]
  resources :references
end
