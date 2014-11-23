Rails.application.routes.draw do
  resources :favorites
  
  resources :stories do
    collection do
      get 'fetch'
    end
  end
  resources :videos do
    collection do
      get 'fetch'
    end
  end
  resources :galleries do
    collection do
      get 'fetch'
    end
  end

  devise_for :users

  root 'home#index'
end
