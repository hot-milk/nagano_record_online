Rails.application.routes.draw do
  root to: 'products#index'
  get '/about' => 'static_pages#about'
  get '/admin' => 'static_pages#admin'
  resource :shipment, only:[:create]
  resources :contacts, only: %i(index create)
  resources :contacts, only:[:show, :update]
  resources :products do
    resources :recorded_musics, only:[:create,:destroy]
    resources :reviews, except:[:index,:show]
    resources :favorites, only:[:create,:destroy]
  end
  resources :user_products, except:[:new,:show,:edit]
  resources :orders, only:[:new,:create,:index]
  resources :labels, except:[:show]
  resources :genre, except:[:show]
  resources :artist, except:[:show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
