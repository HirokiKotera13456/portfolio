class CommentFavoritesController < ApplicationController
  def create
    @dog = Dog.find(params[:dog_id])
    @dog_comment = DogComment.find(params[:dog_comment_id])
    @favorite = CommentFavorite.new(user_id: current_user.id, dog_id: params[:dog_id], dog_comment_id: params[:dog_comment_id])
    @favorite.save!
    # redirect_to dog_path(@dog)
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    @dog_comment = DogComment.find(params[:dog_comment_id])
    @favorite = current_user.comment_favorites.find_by(dog_id: params[:dog_id], dog_comment_id: params[:dog_comment_id])
    @favorite.destroy
    # redirect_to dog_path(@dog)
  end
end
