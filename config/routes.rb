Phishorfish::Application.routes.draw do

  devise_for :users
  resources :scams
  resources :scam_articles

  # map '/' to be a redirect to '/scams'
  root :to => redirect('/scams')

  get '/my_posts', to: 'scams#my_posts', as: 'my_posts'

end
