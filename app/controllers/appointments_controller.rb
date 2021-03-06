class AppointmentsController < ApplicationController
  before_action :require_login
  before_action :check_user, only: [:index]
  before_action :set_user, only: [:new, :create, :index, :edit]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :check_status, only: [:edit, :update, :destroy]
  before_action :check_appointment, only: [:edit, :update]
  before_action :check_doctor, only: [:pending, :all_upcoming, :accepted, :declined]
  
  def new
  end

  def index
    @appointments = current_user.appointments.order(created_at: :DESC).page params[:page]
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

  def pending
    @appointments = Appointment.status('pending', params[:search])
    @appointments = @appointments.page(params[:page]) 
  end

  def all_upcoming
    @appointments = Appointment.upcoming(params[:search])
    @appointments = @appointments.page(params[:page])
  end

  def accepted
    @appointments = Appointment.status('accepted', params[:search])
    @appointments = @appointments.page(params[:page])
  end

  def declined
    @appointments = Appointment.status('declined', params[:search])
    @appointments = @appointments.page(params[:page])  
  end

  def update_status
    app_id = params[:id].to_i
    app_status = params[:status].to_i
    appointment = Appointment.find(app_id)
    appointment.update(status: app_status)
    if appointment.save
      SmsAppointmentStatusJob.perform_later(appointment)
      respond_to do |format|
        format.html
        format.json {render json: appointment }
      end
    else
      redirect_to pending_appointments_path
      flash[:error] = 'Something is wrong. Please try again later.'
    end
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def appointment_params
    params.require(:appointment).permit(:pet_id, :description, :appointment_date, :location, :time)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def check_user
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
      flash[:error] = 'Access Denied'
    end
  end

  def check_appointment
    if current_user != set_appointment.user
      redirect_to root_path
      flash[:error] = 'Access Denied'
    end
  end

  def check_status
    if set_appointment.status != 'pending'
      redirect_to root_path
      flash[:error] = 'Access Denied'
    end
  end

  def check_doctor
    if !current_user.doctor?
      redirect_to root_path
      flash[:error] = 'Access Denied'
    end
  end
end
