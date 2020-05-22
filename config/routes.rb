Rails.application.routes.draw do
  get '/post_search/search_example', to: 'post_search#search_example'
  get '/post_search/search', to: 'post_search#search', as: 'search_posts'
  resources :posts
  devise_for :users
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
