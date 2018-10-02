Rails.application.routes.draw do
  resources :cohorts, only: [:index, :show]
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :projects, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  get '/projects', to: "projects#index"

  resources :sessions, only: [:new, :create]

  delete "/sessions", to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
