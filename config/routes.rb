Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :game_worlds do
    resources :reservations, only: %i[new create]
  end

  resources :reservations, except: %i[new create]
end
