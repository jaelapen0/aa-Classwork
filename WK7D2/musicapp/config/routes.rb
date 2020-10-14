Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :destroy, :new]
  resource :sessions, only: [:create, :destroy, :new]
  resources :bands
end