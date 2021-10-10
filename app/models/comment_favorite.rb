class CommentFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :dog_comment
end
