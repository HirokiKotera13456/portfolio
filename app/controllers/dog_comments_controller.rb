class DogCommentsController < ApplicationController

  def create
    @dog = Dog.find(params[:dog_id])
    @comment = current_user.dog_comments.new(dog_comment_params)
    @comment.dog_id = @dog.id
    @comment.save

  end
  def destroy
    @dog =Dog.find(params[:dog_id])
    DogComment.find_by(id: params[:id], dog_id: params[:dog_id]).destroy
  end

  private

  def dog_comment_params
    params.require(:dog_comment).permit(:comment).merge(user_id: current_user.id)
  end
end