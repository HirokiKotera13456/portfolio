class Dog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :dog_comments, dependent: :destroy
end
