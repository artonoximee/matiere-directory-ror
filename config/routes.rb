Rails.application.routes.draw do
	root 'structures#index'
  resources :structures
  resources :structure_types, only: [:create, :new, :edit, :update, :destroy]
end
