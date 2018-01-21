Rails.application.routes.draw do
  
  #Routes for users
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      :sessions => 'users/sessions',
      :registrations => "users/registrations",
      :passwords => "users/passwords"
    }
  end

  #Routes for authenticated and authenticated users
  devise_scope :user do
    authenticated :user do
      root 'tasks#index'
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  #Routes for tasks and activities
  resources :taks do
    resources :activities
  end

  #Redirect non-existent routes to home
  get '*path' => redirect('/')

end
