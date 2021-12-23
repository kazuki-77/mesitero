class PostCommentsController < ApplicationController
#今回はコメント投稿だけの一覧画面や投稿画面は作成せず、
#その代わり、投稿画像の詳細画面(/post_image/:id)にコメント投稿機能を実装する
  def create
    post_image = PostImage.find(params[:post_image_id])#コメントする投稿内容を見つけてくる
    comment = current_user.post_comments.new(post_comment_params)#ログインしているユーザーが新規コメントをする
    comment.post_image_id = post_image.id#投稿画像のidをコメントに関連づける
    comment.save#保存する
    redirect_to post_image_path(post_image)#コメントした投稿画像の詳細画面にリダイレクトする

  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy#find_by(id: params[:id])でコメントのidを探して削除する
    redirect_to post_image_path(params[:post_image_id])#削除したコメントの投稿画像にリダイレクトする

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
