class PostImage < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  
  attachment :image #_idは含めずに記述する
  #モデルに、画像アップ用のメソッド(attachment)を追加して、フィールド名に(image)を指定する
  #refileを使用する上でのルール
end
