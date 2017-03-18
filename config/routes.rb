Rails.application.routes.draw do

  resources :advertisements

  resources :posts

  get 'advertisments' => 'advertisements#index'

  get 'posts' => 'posts#index'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
