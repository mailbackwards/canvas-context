Rails.application.routes.draw do
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

  root 'home#index'
end
