Rails.application.routes.draw do
  root 'main#index'
  get '/rsvp', to: 'rsvp#index'
  patch '/rsvp', to: 'rsvp#update'
  resources :invite, only: :index
  resources :thanks, only: :index
end
