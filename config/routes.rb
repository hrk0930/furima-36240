Rails.application.routes.draw do



  devise_for :users
  #resources  :users,    only: :show


  devise_for :users
  #resources  :users,    only: :show


  devise_for :users


  root to: 'items#index'
  resources  :items,    only: [:index, :new]
  
end
