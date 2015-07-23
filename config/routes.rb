Rails.application.routes.draw do
  resources :subscribers, only: [:index, :create, :destroy]
end
