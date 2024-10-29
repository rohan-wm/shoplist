Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/show'
  devise_for :users
  root to: "lists#index"
  resources :lists do
    post 'add_friend', on: :member
    resources :items do
      member do
        patch :toggle_checked
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
