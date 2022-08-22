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
  validates :kind, inclusion: { in: Post.kinds.keys }
  validates :genre, inclusion: { in: Post.genres.keys }
  validates :is_published, inclusion: [true, false]
end
