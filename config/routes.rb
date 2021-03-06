Rails.application.routes.draw do

  root to: 'products#index'
  get '/about' => 'static_pages#about'
  get 'products/admin' => 'products#admin'
  get 'products/search' => 'products#search'
  post '/pay' => 'orders#pay'

  resources :shipments, only:[:new,:create]
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

  resources :orders, only:[:new,:create,:index,:update,:show] do
    resources :order_items, except:[:show,:destroy]
  end

  resources :labels, except:[:show]
  resources :genres, except:[:show]
  resources :artists, except:[:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
