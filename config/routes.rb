Rails.application.routes.draw do

  devise_for :users

  root to: "posts#index"
  resources :posts do
    resources :comments
  end

  get 'users/index'
  resources :users

  # get "make_admin", to: "users#make_admin", as: 'make_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "main#index"
end
