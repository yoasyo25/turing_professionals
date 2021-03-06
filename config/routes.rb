Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/technologies/most_popular', to: "technologies/technologies#index"
      get '/workplaces/titles', to: "workplaces/titles#index"
      get '/user_locations/everywhere', to: "user_locations/user_locations#index"
      get '/industry_tech', to: "industries/industries#show"
    end
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, except: [:destroy]
  resources :messages, only: [:index, :create]

  resources :users, except: [:destroy, :index]
  get '/members', to: 'users#index'


  get '/dashboard', to: "dashboard#show"

  resources :contacts, only: [:create]

  get 'insights', to: 'insights#index'

  get '/profile', to: "profile#show"

  get "/filter_companies", to: "filter_companies#index"
  get "/order_companies", to: "order_companies#index"

  get "/filter_members", to: "filter_members#index"
  get "/order_members", to: "order_members#index"

  resources :companies, only: [:index]
  resources :interview_questions, only: [:create]
  resources :locations, only: [:index]

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  root 'welcome#index'

  namespace :admin do
    get '/dashboard', to: "dashboard#show"
    resources :users, only: [:update]
    resources :companies, only: [:destroy]
  end

  delete '/favorite_users', to: 'favorite_users#destroy'
  post '/favorite_users', to: 'favorite_users#create'

  delete '/favorite_companies', to: 'favorite_companies#destroy'
  post '/favorite_companies', to: 'favorite_companies#create'
  get '/:company', to: 'companies#show', as: :company

  mount ActionCable.server, at: '/cable'
end
