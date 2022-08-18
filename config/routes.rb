Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :game_worlds do
    resources :reservations, only: %i[new create]
  end

  resources :reservations, except: %i[new create]

  get '/my_game_worlds', to: 'game_worlds#my_game_worlds'

  get '/owner_reservations', to: 'reservations#owner_reservations'
  get '/owner_reservation/:id', to: 'reservations#owner_reservation', as: :owner_reservation
  get '/owner_reservation/:id', to: 'reservations#edit'
  patch '/owner_reservation/:id', to: 'reservations#update'
  delete '/owner_reservation/:id', to: 'reservations#owner_destroy'
end
