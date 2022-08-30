Rails.application.routes.draw do
  resources :images
  
  resources :articles do
    resources :comments
  end
  
  root "articles#index"
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
end
