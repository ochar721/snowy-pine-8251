Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: [:index, :show] do
    resources :flight_passenger, only: :destroy
  end
  
  resources :airlines, only: :show
end
