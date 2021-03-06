Rails.application.routes.draw do
  root to: redirect('/subs')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]

  resources :comments, only: [:create, :show] do
     member do
      post 'downvote'
      post 'upvote'
    end
  end

  resources :subs, except: [:destroy]

  resources :posts, except: [:destroy, :index] do
    member do
      post 'downvote'
      post 'upvote'
    end
    resources :comments, only: [:new]

  end

end
