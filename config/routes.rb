Rails.application.routes.draw do
  resources :users, except: %i[new edit]
  resources :devices, except: %i[index new edit]
  get 'admin/devices', to: 'devices#admin_index'
  get 'client/devices', to: 'devices#client_index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
