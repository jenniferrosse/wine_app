Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'

  get 'pages/contact'

  resources :producers do
    collection { post :import}
      collection do
        get 'search'
      end
  end

  root 'pages#home'

  #get '*path' => redirect('/')
end
