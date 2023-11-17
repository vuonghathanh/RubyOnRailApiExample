Rails.application.routes.draw do
  resources :groups
  get 'current_user/index', to: 'current_user#index'
  get 'current_user/test', to: 'current_user#test'
  get 'groups/:page/:limit', to: 'groups#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations'
  }
end
