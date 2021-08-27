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
  resources :users do
    collection do
      get :email_users_list
    end
  end
  resources :subcategories, :categories

  post 'users/:id/assign_user_role', to: 'users#assign_user_role', as: 'assign_user_role'
  get'/sign_in', to: redirect("/users/sign_in", status: 301) # dirty

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
