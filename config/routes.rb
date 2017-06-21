Rails.application.routes.draw do
  resources :envs

  resources :apps do
    resources :configs
  end

  root 'apps#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
