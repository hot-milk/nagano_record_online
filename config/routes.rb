Rails.application.routes.draw do

  root to: 'products#index'
  get '/about' => 'static_pages#about'
namespace :admin do
  get '/admin' => 'static_pages#admin'
  get 'products/admin' => 'products#admin'
end
  get 'products/search' => 'products#search'
  resource :shipment, only:[:create]
  resources :contacts, only:[:index,:create,:destroy]
  devise_for :users
  resources :users, only: [:index]
  resources :users, except:[:new, :create] do
    resources :contacts, only:[:show,:update]

  end
  resources :products do
    resources :recorded_musics, only:[:create,:destroy]
    resources :reviews, except:[:index,:show]
    resources :favorites, only:[:create,:destroy]
  end
  resources :user_products, except:[:new,:show,:edit]
  resources :orders, only:[:new,:create,:index]
  resources :labels, except:[:show]
  resources :genres, except:[:show]
  resources :artists, except:[:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
