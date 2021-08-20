Rails.application.routes.draw do

  resources :subcategories
  devise_for :users

  root to: "posts#index"

  resources :posts do
    collection do
      get :autocomplete
    end
    resources :comments
  end

  resources :subcategories, :categories, :users

  post 'users/:id/assign_user_role', to: 'users#assign_user_role', as: 'assign_user_role'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
