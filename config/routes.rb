Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/show'
  get 'user/edit'
    root    'chatroom#index'
    get     'login', to: 'sessions#new'

end
