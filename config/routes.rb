Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  get 'dashboard', to: 'pages#dashboard'
  # patch 'flats/:id/like', to: 'flats#like', as: :like_flat

  resources :flats do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]

    collection do
      get :map
    end

    member do
      patch :like
    end
  end

  resources :chatrooms, only: [:create, :show]

end
