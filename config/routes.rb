Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  resources :forms, only: [:new, :create]
  post '/forms/:id/archive', to: 'forms#archive', as: :form_archive
end
