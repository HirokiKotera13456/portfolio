class DogComment < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :comment, presence: true
end
