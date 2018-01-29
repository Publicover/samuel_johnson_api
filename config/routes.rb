Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :words do
    resources :definitions
  end
  post 'auth/login', to: 'authenticate#authenticate'
  post 'signup', to: 'users#create'
end
