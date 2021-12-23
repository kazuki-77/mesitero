class FavoritesController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])#PostImageテーブルの投稿画像のidを見つけ、post_imageに代入
    favorite = current_user.favorites.new(post_image_id: post_image.id)#ログインしているユーザーが投稿画像にいいねをするということを、favoriteに代入する
    favorite.save#いいねを保存する
    redirect_to post_image_path(post_image)#いいねした投稿画像の詳細画面にリダイレクトする
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])#PostImageテーブルの投稿画像のidを見つけ、post_imageに代入
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)#ログインしているユーザーが投稿画像にいいねされているのを見つけ、favoriteに代入する
    favorite.destroy#そのいいねを削除する
    redirect_to post_image_path(post_image)#いいねを消した投稿画像の詳細にリダイレクトする
  end

end
