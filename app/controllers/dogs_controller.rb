class DogsController < ApplicationController

  def new
    @newdog =Dog.new
  end

  def create
    @newdog = Dog.new(dog_params)
    @newdog.user_id = current_user.id
   if @newdog.save
     redirect_to dogs_path
   else
      @user = current_user
      render :index
   end
  end

  def index
    @dogs = params[:tag_id].present? ? Tag.find(params[:tag_id]).dogs.page(params[:page]).reverse_order : Dog.all.page(params[:page]).reverse_order
    @user = current_user
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to dog_path(@dog.id),notice: "編集されました"
    else
      render :edit
    end
  end

  def show
    @dog=Dog.find(params[:id])
    @user = @dog.user
    @dog_comment = DogComment.new
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end


  private

  def dog_params
    params.require(:dog).permit(:name, :image, :caption, tag_ids: [])
  end

end