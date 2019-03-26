class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def show
    find_user
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    find_user
    render :edit
  end

  def update
    find_user
    # @user.update(user_params)
    # session[:user_id] = @user.id
    if @user.update(user_params)
      @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    find_user
     @user.destroy
    redirect_to "/"
  end

  def appointments
    find_user
    @walking_appointments =
    Appointment.all.select do |appt|
        appt.walker_id == current_user.id
    end
    render :appointments


  end



  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :address, :city, :state, :zip_code, :dob)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
