Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#home'

  get '/search' => "visitors#search", as: :search
  devise_for :users
end
