Cfp::Engine.routes.draw do
  root :to => "proposals#index"

  resources :proposals, :except => [:show] do
    resources :comments
  end
end
