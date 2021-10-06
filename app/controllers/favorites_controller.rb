class FavoritesController < ApplicationController
  def create
    @dog = Dog.find(params[:dog_id])
    @favorite = current_user.favorites.new(dog_id: @dog.id)
    @favorite.save
    
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    @favorite = current_user.favorites.find_by(dog_id: @dog.id)
    @favorite.destroy
  end
end
