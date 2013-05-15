EaLunchReservation::Application.routes.draw do
  root :to => "reservations#index"
  resources :reservations, except: :show do
    member do
      put :backup_availability
    end
  end
  resource :update, only: [:show]
  resources :foods, only: []
  resources :users, only: []
  resource :summaries, only: [] do
    get :today
  end
end
