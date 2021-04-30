Rails.application.routes.draw do
  resources :create_challenges
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'create_challenges#index'
end
