class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  include LiberalEnum

  enum type: { :illust, :text }
  liberal_enum :type
  enum genre: { :original, :fanart }
  liberal_enum :genre


  validates :title, presence: true
  validates :text, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
  validates :type, inclusion: { in: Post.types.keys }
  validates :type, inclusion: { in: Post.types.keys }
  validates :is_published, inclusion: [true, false]
end
