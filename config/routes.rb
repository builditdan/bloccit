Rails.application.routes.draw do

#  get 'advertisement/index'

#  get 'advertisement/show'

#  get 'advertisement/new'

#  get 'advertisement/create'

#  resources :advertisement
  resources :advertisements


  resources :posts

  get 'about' => 'welcome#about'

#  get 'welcome/contact'

#  get 'welcome/faq'

  root to: 'welcome#index'

end
