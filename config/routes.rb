Rails.application.routes.draw do

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

  # get all articles
  get '/api/v1/articles' => 'api/v1/article_api#articles'

  # adds a new article
  post '/api/v1/articles' => 'api/v1/article_api#add_article'

  # adds a new article
  delete '/api/v1/articles/:id' => 'api/v1/article_api#delete_article'

  # get '/article' => 'article#show'
  get 'articles', to: 'article#show'
  post 'articles', to: 'article#create'
  delete 'articles', to: 'article#delete'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
