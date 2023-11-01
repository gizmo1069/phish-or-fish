Rottenpotatoes::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :scams
  # map '/' to be a redirect to '/scams'
  root :to => redirect('/scams')


end
