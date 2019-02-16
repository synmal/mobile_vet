class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  before_action :require_login, except: [:new, :create]

  def new
  end

  def show
    if current_user != User.find(params[:id])
      redirect_to user_path(current_user.id)
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Account created"
    else
      redirect_to new_user_path
      flash[:error] = user.errors.full_messages[0]
    end
  end

  def edit
    if current_user != User.find(params[:id])
      redirect_to edit_user_path(current_user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
      flash[:success] = 'Profile updated'
    else
      redirect_to edit_user_path(@user.id)
      flash[:error] = 'Something is wrong'
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path
      flash[:success] = 'Your account successfully deleted'
    else
      redirect_to edit_user_path(@user.id)
      flash[:error] = 'Something is wrong. Please try again later'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :address, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
