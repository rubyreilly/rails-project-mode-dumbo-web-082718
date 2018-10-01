Rails.application.routes.draw do
  resources :cohorts, only: [:index, :show]
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :projects, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :user_projects, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
