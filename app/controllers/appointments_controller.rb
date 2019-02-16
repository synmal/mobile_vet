class AppointmentsController < ApplicationController
  before_action :set_user
  before_action :require_login

  def new
  end

  def index
  end

  def show
  end

  def create
    appointment = @user.appointments.new(appointment_params)
    if appointment.save
      redirect_to root_path
      flash[:success] = 'Appointment successfully created.'
    else
      redirect_to new_user_appointment_path(@user.id)
      flash[:error] = appointment.errors.full_messages[0]
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def appointment_params
    params.require(:appointment).permit(:pet_id, :description, :appointment_date, :location)
  end
end
