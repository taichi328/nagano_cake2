Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  root to: "public/homes#top"
  get "about" => "public/homes#about"
  get "customers/my_page" => "public/customers#show"
  get "customers/information/edit" => "public/customers#edit"
  patch "customers" => "public/customers#update"

  namespace :public do
    resources :items, only: [:index, :show]
  end

  namespace :public do
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'check'
        patch 'withdraw'
      end
    end
  end

  namespace :public do
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
  end

  namespace :public do
    resources :orders, only: [:index, :new, :show, :create] do
      collection do
        get 'complete'
        post 'check'
      end
    end
  end

  get "admin" => "admin/homes#top"
  namespace :admin do
    resources :items
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :orders, only: [:show]
  end
end
