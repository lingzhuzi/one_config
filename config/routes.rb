Rails.application.routes.draw do
  resources :envs

  resources :apps do
    resources :configs
  end

  get 'configs/download', to: 'configs#download'

  root 'apps#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
