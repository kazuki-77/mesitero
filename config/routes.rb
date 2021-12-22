Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  #resourcesメソッドはルーティングを一括して自動生成してくれる
  #onlyは生成するルーティングを限定するオプション
  #不要なルーティングがされないようにonlyを設定する
end