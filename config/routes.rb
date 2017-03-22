Rails.application.routes.draw do

  resources :topics do
    resources :sponsored_posts
  end

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'topics' => 'topics#index'

  get 'posts' => 'posts#index'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
