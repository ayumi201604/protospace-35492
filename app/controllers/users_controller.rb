class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
     redirect_to edit_prototype_path
    else
      render :edit
    end
  end

  def show
    user = User.find(params[:id])
    @name = current_user.name
    @prototypes = current_user.prototypes
  end
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
