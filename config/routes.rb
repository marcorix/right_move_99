Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :flats do
    collection do
      get :map
    end
    resources :reviews, only: [:create]
  end
end
