Rails.application.routes.draw do
  resources :users, except: %i[new edit]
end
