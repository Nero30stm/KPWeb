Rails.application.routes.draw do
     scope :path => "/:locale", :locale =>  /en|ru/ do
    resources :awards
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
     get 'welcome/index'
    root 'welcome#index'
    root to: "home#index"
    resources :restaurants
    resources :products
    resources :restbookings
    resources :dishes
    resources :items
    resources :awards
   
  end
   resources :restaurants do
      resources :restreviews
    end
    resources :restaurants do
      resources :restbookings
    end
    resources :restaurants do
      resources :workers
    end
    resources :restaurants do
      resources :products
    end
end
