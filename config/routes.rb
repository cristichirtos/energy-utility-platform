Rails.application.routes.draw do
  resources :users, except: %i[new edit]
  resources :devices, except: %i[index new edit]
  get 'admin/devices', to: 'devices#admin_index'
  get 'client/devices', to: 'devices#client_index'
  get 'admin/chats', to: 'chats#index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  mount ActionCable.server => 'cable'

  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
end
