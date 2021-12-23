class PostImage < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites,dependent: :destroy

  def favorited_by?(user)#favorited_by?メソッド
    favorites.where(user_id: user.id).exists?#引数で渡されたユーザーidがFavoritesテーブル内に存在(exists?)してるかどうか調べている
  end

  attachment :image #_idは含めずに記述する
  #モデルに、画像アップ用のメソッド(attachment)を追加して、フィールド名に(image)を指定する
  #refileを使用する上でのルール
end
