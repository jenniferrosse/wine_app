Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/contact'

  resources :wineries do
    collection { post :import}
      collection do
        get 'search'
      end
  end

  root 'pages#home'
end
