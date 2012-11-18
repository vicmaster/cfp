Rails.application.routes.draw do

  devise_for :users

  mount CFP::Engine => "/cfp"
end
