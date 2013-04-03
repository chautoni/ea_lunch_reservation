EaLunchReservation::Application.routes.draw do
  root :to => "reservations#index"
  resources :reservations, except: :show
  resource :update, only: [:show]
  resources :foods, only: []
  resources :users, only: []
  resource :summaries, only: [] do
    get :today
  end
end
