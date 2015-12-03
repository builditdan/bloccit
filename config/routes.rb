Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about1'

  root 'welcome#index'

end
