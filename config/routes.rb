Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users do
    post 'sign_in', :to => 'devise/session#create', :as => :session
  end
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about' # Redirecting the about variable to a welcome/about
  get 'newpost' => 'posts#new'
  root to: 'welcome#index'

end
