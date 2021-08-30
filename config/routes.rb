

Rails.application.routes.draw do

  resources :subcategories
  devise_for :users

  root to: "posts#index"

  # require 'sidekiq/web'
  # require 'sidekiq-scheduler/web'
  # authenticate :user do #should be :admin here
  #   mount Sidekiq::Web, at: "/sidekiq"
  # end

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
  resources :categories

  post 'users/:id/assign_user_role', to: 'users#assign_user_role', as: 'assign_user_role'
  get'/sign_in', to: redirect("/users/sign_in", status: 301) # dirty

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
