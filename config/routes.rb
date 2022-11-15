Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "movies#index"
  resources :movies, only: [:index, :show] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: %w[destroy]
  resources :lists, only: [:index, :new, :create, :show, :destroy ]
end
