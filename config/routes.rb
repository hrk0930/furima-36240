Rails.application.routes.draw do
<<<<<<< Updated upstream
=======
  devise_for :users
  #resources  :users,    only: :show

>>>>>>> Stashed changes
  root to: 'items#index'
  resources  :items,    only: [:index, :new]
  
end
