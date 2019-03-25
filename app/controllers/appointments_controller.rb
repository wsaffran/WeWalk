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
    params.require(:appointment).permit(:walker_id, :dog_id, :appointment_date, :walk_duration, :notes, :appointment_time)
  end

end
