Phishorfish::Application.routes.draw do

  resources :scams
  # map '/' to be a redirect to '/scams'
  root :to => redirect('/scams')


end
