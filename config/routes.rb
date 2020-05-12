Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
