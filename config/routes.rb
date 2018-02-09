Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :words, param :name do
  #   resources :definitions
  # end
  # resources :words
  # get 'words', to: 'words#index'
  # get 'words/:name', to: 'words#show'
  resources :words, param: :name
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
