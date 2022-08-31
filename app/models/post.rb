class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images


  enum kind: [ :illust, :text ]

  enum genre: [ :original, :fanart ]


  validates :title, presence: true
  validates :text, presence: true, unless: :was_attached?
  def was_attached?
    self.images.attached?
  end
  validates :kind, inclusion: { in: Post.kinds.keys, message:'を選択してください' }
  validates :genre, inclusion: { in: Post.genres.keys, message:'を選択してください' }
  validates :is_published, inclusion: [true, false]
  validates :images, length: { maximum: 5, message: "は1枚以上5枚以下にしてください" }

end
