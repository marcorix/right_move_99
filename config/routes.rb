Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :flats do 
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

end
