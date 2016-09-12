Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :rooms do
    get :new_booking
  end

  resources :bookings do
  end

  resources :employees do
  end

  root to: 'rooms#index'
end
