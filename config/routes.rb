Rails.application.routes.draw do
	root 'structures#index'
  resources :structures
end
