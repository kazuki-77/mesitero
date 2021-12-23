class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])#userのidを取得することで関連づけられているそのユーザーの投稿(post_image)も取得できる
    @post_images = @user.post_images.page(params[:page]).reverse_order
    #そのユーザー(@user)に関連づけられた投稿(.post_images)のみ、@post_imagesに渡すことができる
  end

  def edit
    @user = User.find(params[:id])
    #params[:id]でユーザーの情報を取得してインスタンス(@user)に保存し、編集用Viewでform_withを使う準備をしている
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
