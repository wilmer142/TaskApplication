Rails.application.routes.draw do
  
  get 'welcomes/index'

  get 'tasks/index'

  get 'activities/index'

  #Routes for devise
  devise_for :users

  #Roots for authenticated and authenticated users
  devise_scope :user do
    authenticated :user do
      root 'welcomes#index'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
