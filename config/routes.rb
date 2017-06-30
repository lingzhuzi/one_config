Rails.application.routes.draw do
  resources :users
  resources :envs

  resources :apps do
    resources :configs
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'download/:app_name/:env', to: 'download#index'

  root 'apps#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
