class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  #ログイン認証が済んでいない状態でトップページ以外の画面にアクセスしても、ログイン画面へリダイレクトするように
  before_action :configure_permitted_parameters, if: :devise_controller?
  #deviseの利用機能(ユーザー登録、ログイン認証など)が使われる場合、
  #その前にconfigure_permitted_parametersが実行される
  def after_sign_in_path_for(resource)#ログイン後は投稿一覧画面に遷移するように設定
    post_images_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
   #devise_parameter_sanitizerでnameのデータを操作を許可するアクションメソッドが指定される
   #今回は、ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作が行われる
end
