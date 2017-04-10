Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'
  get '/home', to: 'home#index'

  # get all articles
  get '/api/v1/articles' => 'api/v1/article_api#articles'

  # adds a new article
  post '/api/v1/articles' => 'api/v1/article_api#add_article'

  # adds a new article
  delete '/api/v1/articles/:id' => 'api/v1/article_api#delete_article'

  get '/article' => 'article#show'
  post '/article' => 'article#create'
end
