Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  
  resources :forms, only: [:new, :create, :update]
  post '/forms/:id/archive', to: 'forms#archive', as: :archive_form
  
  get '/f/:uuid', to: 'forms#edit', as: :edit_form
  post '/f/:uuid', to: 'responses#create', as: :create_response
  
  get '/f/:uuid/responses', to: 'forms#responses', as: :form_responses
  
end
