Facebook::Application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :messages
  resources :users do
    member do
      post :add_friend      
    end
  end
  root to: 'users#show' 

end
