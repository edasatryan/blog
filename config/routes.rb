Rails.application.routes.draw do

  # namespace :api do
  #   namespace :v1 do
  #     get 'comments_api/create'
  #   end
  # end

  # get 'comments_api/create'
  #
  # get 'comments_a_pi/create'
  resources :article do
    resources :comments
  end

  get 'users/index'
  get 'users/invite', to: 'users#invite'
  post 'users/send', to: 'users#send_invitation'
  get 'users/send', to: 'users#invite'
  get 'users', to: 'users#new'
  post 'users', to: 'users#create'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get '/', to: 'home#index'
  get '/home', to: 'home#index'

  # get '/article' => 'article#add'
  get 'articles', to: 'article#add'
  get 'articles/:id', to: 'article#show'
  get 'articles/:id/comments', to:'article#show'
  post 'articles', to: 'article#create'
  delete 'articles', to: 'article#delete'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # get all article
  get '/api/v1/article' => 'api/v1/article_api#article'

  # adds a new article
  post '/api/v1/article' => 'api/v1/article_api#add_article'

  # adds a new article
  delete '/api/v1/article/:id' => 'api/v1/article_api#delete_article'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

end
