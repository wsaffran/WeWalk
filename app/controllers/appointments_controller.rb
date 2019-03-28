class AppointmentsController < ApplicationController

  def new
    all_dogs
    @time_selection = [30, 60, 90]
    @appointment = Appointment.new

    render :new
  end

  def create
    @time_selection = [30, 60, 90]
    all_dogs
    @appointment = Appointment.create(appointment_params)
    @appointment_tokens = appointment_params[:walk_duration].to_i/30
    @appointment.update(tokens: @appointment_tokens, status: "open")
    if @appointment.valid?
      redirect_to appointment_path(@appointment)
    else
      flash[:errors] = @appointment.errors.full_messages
      render :new
    end
  end

  # def open_appointments
  #   @open_appointments = Appointment.all.select do |appointment|
  #     appointment.status == "open"
  #   end
  #   render :open_appointments
  # end

  def open_appointments
    @params_day = []
    @params_duration = []

    if params[:days] || params[:duration]

      if params[:days].nil?
        @params_day = [0,1,2,3,4,5,6,7]
      else
        params[:days].each do |param|
          @params_day << param.to_i
        end
      end
      if params[:duration].nil?
        @params_duration = [30, 60, 90]
      else
        params[:duration].each do |param|
          @params_duration << param.to_i
        end
      end
      @open_appointments = Appointment.all.select do |appointment|
        appointment.status == "open" && @params_day.include?(appointment.appointment_date.wday) && @params_duration.include?(appointment.walk_duration) && appointment.appointment_date > Time.now
      end

    else

    @open_appointments = Appointment.all.select do |appointment|
      appointment.status == "open" && appointment.appointment_date > Time.now
    end
  end

    render :open_appointments
  end


  def show
    find_appointment
    render :show
  end

  def edit
    @time_selection = [30, 60, 90]
    find_appointment
    all_dogs
  end

  def update
    @time_selection = [30, 60, 90]
    find_appointment
    all_dogs
    @appointment.update(appointment_params)
    @appointment_tokens = appointment_params[:walk_duration].to_i/30
    @appointment.update(tokens: @appointment_tokens)
    if @appointment.valid?
      redirect_to appointment_path
    else
      flash[:error] = @appointment.errors.full_messages
      render :edit
    end
  end

  def status_to_scheduled
    find_appointment
    @appointment.update(walker_id: current_user.id, status: "open")
    redirect_to @appointment
  end

  def status_to_open
    find_appointment
    @appointment.update(walker_id: nil, status: "open")
    redirect_to '/appointments/open'
  end

  def status_to_complete
    find_appointment
    @appointment.update(status: "complete")
    walkee = User.find(@appointment.dog.user.id)
    walker = User.find(@appointment.walker_id)
    walkee_tokens = current_user.token_balance - @appointment.tokens
    walker_tokens = walker.token_balance + @appointment.tokens
    walkee.update(token_balance: walkee_tokens)
    walker.update(token_balance: walker_tokens)
    redirect_to "/appointments/open"
  end


  def destroy
    find_appointment.destroy
    redirect_to '/'
  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def all_dogs
    @dogs = current_user.dogs
  end

  def appointment_params
    params.require(:appointment).permit(:walker_id, :dog_id, :appointment_date, :walk_duration, :notes, :appointment_time, :status)
  end

end
