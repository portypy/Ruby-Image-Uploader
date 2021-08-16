Rails.application.routes.draw do


  devise_for :users

  root to: "posts#index"

  resources :posts do
    collection do
      get :autocomplete
    end
    resources :comments
  end

  resources :users

  get 'users/index'
  post 'users/:id/assign_user_role', to: 'users#assign_user_role', as: 'assign_user_role'

  resources :categories

  get 'subcategory/index'
  get 'subcategory/new'
  get 'categories/index'
  get 'categories/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "main#index"
end
