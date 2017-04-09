Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'

  # adds a new article
  post '/api/v1/articles' => 'api/v1/article#add_article'


end
