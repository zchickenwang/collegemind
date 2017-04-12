Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :comments
  end
  resources :tags
  resources :admins
  resources :admin_sessions, only: [ :new, :create, :destroy ]

  get 'login' => 'admin_sessions#new'
  get 'logout' => 'admin_sessions#destroy'

  get "/pages/:page" => "pages#show"
end
