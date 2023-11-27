Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :flats do 
    resources :reviews, only: [:create]
  end

end
