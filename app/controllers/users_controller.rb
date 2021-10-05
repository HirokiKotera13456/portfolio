class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dogs =@user.dogs
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
end


  def index
    @users = User.page(params[:page]).reverse_order
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render :edit
    else
     redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id) ,notice: "You have updated user successfully."
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :opinion, :is_deleted)
  end

end
