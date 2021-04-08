Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :sales_records, only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
