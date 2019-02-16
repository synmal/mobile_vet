class PetsController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:index]

  def new
  end

  def create
    pet = current_user.pets.new(pet_params)
    if pet.save
      redirect_to user_pets_path(current_user.id)
      flash[:success] = 'Pet successfully created'
    else
      redirect_to new_user_pet_path(current_user.id)
      flash[:error] = pet.errors.full_messages[0]
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :age, :pet_type, :breed)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
