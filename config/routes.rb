Rails.application.routes.draw do
  get '/event_search/search_example', to: 'event_search#search_example'
  get '/event_search/search', to: 'event_search#search', as: 'search_events'
  resources :events
  resources :tags
  resources :pages
  get '/post_search/search_example', to: 'post_search#search_example'
  get '/post_search/search', to: 'post_search#search', as: 'search_posts'
  resources :posts
  devise_for :users
  root 'static_pages#welcome'
  get '/static_pages/texts', to: 'static_pages#texts', as: 'texts'
  get '/static_pages/debate_a_vegan', to: 'static_pages#debate_a_vegan', as: 'debate_a_vegan'

  #get '/event_calendar', to: 'event_calendar#event_calendar', as: 'event_calendar'
  get '/event_calendar/(:date)', to: 'event_calendar#event_calendar', as: 'event_calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
