Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create] do
    collection do
      post :confirm
      post :new
    end
  end

  #post 'users/confirm' => 'users#confirm'
  #post 'users/new' => 'users#new'

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
