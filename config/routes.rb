Paporeto::Application.routes.draw do
  # Uploadbox  
  mount Uploadbox::Engine => '/uploadbox', as: :uploadbox
  
  # Uploadbox
  devise_for :users

  # Admin ------------------------------------------------------------------------
  namespace :admin do
    resources :categories, except: :show
    resources :articles
    resources :users, except: :show

    root 'articles#index'
  end

  # Public ------------------------------------------------------------------------
  
  resources :categories, path: '', only: [] do
    resources :articles, path: '', only: [:index, :show]
  end

  root 'home#index'
end
