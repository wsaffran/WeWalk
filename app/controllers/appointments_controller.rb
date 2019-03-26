class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
    all_dogs
    render :new
  end

  def create
    @appointment = Appointment.create
    if @appointment.valid?
      redirect_to appointment_path(@appointment)
    else
      flash[:errors] = @appointment.errors.full_messages
      render :new
    end
  end

  def open_appointments
    @open_appointments = Appointment.all.select do |appointment|
      appointment.status == "open"
    end
    render :open_appointments
  end

  def show
    find_appointment
    render :show
  end

  def edit
    find_appointment
    all_dogs
  end

  def update
    find_appointment
    all_dogs
    @appointment.update(appointment_params)
    if @appointment.valid?
      redirect_to appointment_path
    else
      flash[:error] = @appointment.errors.full_messages
      render :edit
    end
  end

  def status_to_scheduled
    find_appointment
    @appointment.update(walker_id: current_user.id, status: "scheduled")
    redirect_to @appointment
  end

  def destroy
    find_appointment.destroy
    redirect_to appointments_path
  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def all_dogs
    @dogs = Dog.all
  end

  def appointment_params
    params.require(:appointment).permit(:walker_id, :dog_id, :appointment_date, :walk_duration, :notes, :appointment_time, :status)
  end

end
