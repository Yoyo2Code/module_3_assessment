Rails.application.routes.draw do
  root 'items#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/items', to: "items#index"
    end
  end

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
