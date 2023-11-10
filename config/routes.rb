Phishorfish::Application.routes.draw do

  devise_for :users
  resources :scams
  # map '/' to be a redirect to '/scams'
  root :to => redirect('/scams')


end
