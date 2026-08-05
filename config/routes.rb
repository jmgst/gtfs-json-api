Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :agencies, only: [ :index, :show ] do
        resources :routes, only: [ :index ]
      end
      resources :routes, only: [ :index, :show ] do
        resources :trips, only: [ :index ]
      end
      resources :stops, only: [ :index, :show ]
      resources :trips, only: [ :index, :show ]
    end
  end
end
