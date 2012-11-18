Cfp::Engine.routes.draw do
  root :to => "proposals#index"

  resources :proposals, :only => [:index, :new, :create]
end
