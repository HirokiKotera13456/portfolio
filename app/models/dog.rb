class Dog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :dog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :dog_tags, dependent: :destroy
  has_many :tags, through: :dog_tags

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
