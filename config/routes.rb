Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'customized_devise/sessions'
  }

  get :secret_page, to: 'users#secret_page'
  get :test_page, to: 'users#test_page'
  resources :users

  root to: 'users#index'
end
