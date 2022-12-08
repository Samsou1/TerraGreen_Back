Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :notifications
  resources :project_registrations
  resources :projects
  resources :project_statuses
  resources :regions
  resources :countries
  post '/togglelike', to: 'likes#toggle'
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  patch '/member-update', to: 'members#update'
end