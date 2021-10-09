class DogComment < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :comment, presence: true
  has_many :comment_favorites, dependent: :destroy

  def favorited_by?(user)
    comment_favorites.where(user_id: user.id).exists?
  end
end
