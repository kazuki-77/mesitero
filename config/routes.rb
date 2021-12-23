Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #resourcesメソッドはルーティングを一括して自動生成してくれる
  #onlyは生成するルーティングを限定するオプション
  #不要なルーティングがされないようにonlyを設定する
    resource :favorites, only: [:create, :destroy]
   #resourceとなっているのは、単数にするとidがリクエストに含まれなくなるため
   #いいねの詳細ページは作成しないので、idの受け渡しも必要ないので、resourceとなっている
    resources:post_comments, only: [:create, :destroy]
    #コメントは投稿画像に対してコメントされる。→ post_commentsは、post_imagesに結びつく
    #このような親子関係を　ネストする　という
  end
  resources :users, only: [:show, :edit, :update]

end