class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
      flash[:success] = "Account created"
    else
      redirect_to new_user_path
      flash[:error] = user.errors.full_messages[0]
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :address, :email, :password)
  end
end
