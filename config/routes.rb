Rails.application.routes.draw do
  
  #Routes for users
  devise_for :users

  #Routes for authenticated and authenticated users
  devise_scope :user do
    authenticated do
      authenticated :user do
        root 'tasks#index'
      end
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  #Routes for tasks and activities
  resources :tasks do
    resources :activities
  end

  #Redirect non-existent routes to home
  get '*path' => redirect('/')

end
