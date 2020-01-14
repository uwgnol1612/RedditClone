Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]

  resources :subs, only: [:new, :index, :show, :edit, :update, :create]

end
