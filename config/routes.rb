Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#home'

  get '/search' => "visitors#search", as: :search
  get :autocomplete_english_word_word, controller: :visitors
  get :autocomplete_persian_word_word, controller: :visitors
  devise_for :users
end
