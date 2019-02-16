class PetsController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:index, :edit]
  before_action :set_pet, only: [:edit, :update, :destroy]

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
    if @pet.update(pet_params)
      redirect_to user_pets_path(current_user.id)
      flash[:success] = 'Pet info updated'
    else
      redirect_to edit_user_pet_path(current_user.id, @pet.id)
      flash[:error] = 'Something is wrong'
    end
  end

  def destroy
    if @pet.destroy
      redirect_to user_pets_path(current_user.id)
      flash[:success] = 'Pet successfully deleted'
    else
      redirect_to user_pets_path(current_user.id)
      flash[:error] = 'Something is wrong'
    end
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :age, :pet_type, :breed)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
