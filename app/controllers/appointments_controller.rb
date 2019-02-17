class AppointmentsController < ApplicationController
  before_action :require_login
  before_action :check_user, except: [:all]
  before_action :set_user, except: [:all]
  before_action :set_appointment, only: [:edit, :update, :destroy]

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
    if @appointment.update(appointment_params)
      redirect_to user_appointments_path(current_user.id)
      flash[:success] = 'Appointment details updated'
    else
      redirect_to edit_user_appointment_path(current_user.id, @appointment.id)
      flash[:error] = @appointment.errors.full_messages[0]
    end
  end

  def destroy
    if @appointment.destroy
      redirect_to user_appointments_path(current_user.id)
      flash[:success] = 'Appointment successfully deleted'
    else
      redirect_to user_appointments_path(current_user.id)
      flash[:error] = 'Something is wrong'
    end
  end

  def all
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def appointment_params
    params.require(:appointment).permit(:pet_id, :description, :appointment_date, :location)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def check_user
    if current_user != set_user
      redirect_to root_path
      flash[:error] = 'Access Denied'
    end
  end
end
