Rails.application.routes.draw do
  resources :envs
  get 'home/index'

  resources :apps do
    resources :configs
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end