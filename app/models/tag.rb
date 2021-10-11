class Tag < ApplicationRecord
  has_many :dog_tags, dependent: :destroy
  has_many :dogs, through: :dog_tags
end
