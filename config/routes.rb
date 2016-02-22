Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  
  resources :forms, only: [:new, :create, :update]
  post '/forms/:id/archive', to: 'forms#archive', as: :archive_form
  
  get '/f/:uuid', to: 'forms#edit', as: :edit_form
end
