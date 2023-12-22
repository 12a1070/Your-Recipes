Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes
  devise_for :users

  resources :recipes do
    resources :favorites, only: [:create, :destroy, :index]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
