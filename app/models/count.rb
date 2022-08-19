class Count < ApplicationRecord
  belongs_to :user
  validates :counts, numericality: { only_integer: true }
end
