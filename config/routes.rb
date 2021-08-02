Rails.application.routes.draw do

  devise_for :users
  resources  :users,    only: :show

  root to: 'items#index'
  resources  :items,    only: [:index, :new, :create]
  
end
