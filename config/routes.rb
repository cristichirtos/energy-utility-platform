Rails.application.routes.draw do
  resources :users, except: %i[new edit]
  resources :devices, except: %i[new edit]
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
