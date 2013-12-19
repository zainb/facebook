Facebook::Application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  
  resources :messages
  root to: 'users#index' 
  
  resources :users do
    member do
      post :add_friend      
    end
  end

end
