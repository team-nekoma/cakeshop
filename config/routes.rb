Rails.application.routes.draw do

  #管理者側ルーティング
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
    namespace :admin do
      get '/' => 'homes#top'
      resources :items, except: [:destroy]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :customers, only: [:index, :show, :edit, :update]
      resources :orders, only: [:show, :update]
      resources :order_details, only: [:update]
    end


  #顧客側ルーティング
    devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root :to =>"homes#top"

    #devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
