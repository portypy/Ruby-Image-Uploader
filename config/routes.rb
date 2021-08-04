Rails.application.routes.draw do

  devise_for :users

  root to: "posts#index"
  resources :posts do
    resources :comments
  end

  get 'users/index'
  resources :users

  post 'users/:id/assign_user_role', to: 'users#assign_user_role', as: 'assign_user_role'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "main#index"
end
