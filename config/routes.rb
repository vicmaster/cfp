Cfp::Engine.routes.draw do
  root :to => "proposals#index"

  resource :profile

  resources :proposals, :except => [:show] do
    resources :comments
    resources :ranks, :only => [ :create ]
  end
end
