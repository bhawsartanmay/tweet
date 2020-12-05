Rails.application.routes.draw do
  devise_for :users
  root :to => "tweet#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tweet, only: [:new, :create, :index]
  resources :users, only: [:index] do
    collection do 
      post :follow
      delete :unfollow
    end
  end
end
