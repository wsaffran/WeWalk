class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  after_action :update_token_balance, only: [:show]

  def home
    render :home
  end

  def show
    find_user
    @all_reviews = all_reviews
    all_stats
    @can_leave_review = can_leave_review?
    @feed = my_completed_appointments.reverse[0..6]
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
    @user_appointments = find_user_appointments
    @walking_appointments =
    Appointment.all.select do |appt|
        appt.walker_id == current_user.id
    end
    @walkee_appointments =
    Appointment.all.select do |appt|
      appt.dog.user.id == current_user.id
    end
    render :appointments
  end

  def find_user_appointments
    user_appointments = []
    Appointment.all.each do |appointment|
      if appointment.walker_id == current_user.id || appointment.dog.user.id == current_user.id
        user_appointments << appointment
      end
    end
    user_appointments
  end

  def can_leave_review?
    response = false
    if @user.id != current_user.id
      Appointment.all.each do |appointment|
        if appointment.walker_id == current_user.id || appointment.dog.user.id == current_user.id
          response = true
        end
      end
    end
    response
  end

  def all_reviews
    all_reviews = []
    Review.all.each do |review|
      if review.reviewee_id == @user.id
        all_reviews << review
      end
    end
    all_reviews
  end

  def update_token_balance
    @user = User.find(params[:id])
    tokens = 0
    my_completed_appointments.each do |appointment|
      if appointment.dog.user.id == @user.id
        tokens -= appointment.tokens
      elsif appointment.walker_id == @user.id
        tokens += appointment.tokens
      end
    end
    @user.update(token_balance: tokens)
  end


  # ALL FOR FEED

  def my_completed_appointments
    a = []
    Appointment.all.each do |appointment|
      if appointment.dog.user.id == User.find(params[:id]).id || appointment.walker_id == User.find(params[:id]).id
        a << appointment
      end
    end
    a.select do |appointment|
      appointment.status == "complete"
    end.sort_by {|appointment| appointment.appointment_date}
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :address, :city, :state, :zip_code, :dob)
  end

  def find_user
    @user = User.find(params[:id])
  end


  def all_stats
    @total_walkee_count = total_walkee_count
    @total_walked_count = total_walked_count
    @total_gained_coins = total_gained_coins
    @total_spent_coins = total_spent_coins
    @total_users = total_users
    @open_appointments = open_appointments
    @scheduled_appointments = scheduled_appointments
    @closed_appointments = closed_appointments
    @user_with_most_coins = user_with_most_coins
  end

  # Admin
  def open_appointments
    count = 0
    Appointment.all.each do |appointment|
      if appointment.status == "open"
        count += 1
      end
    end
    count
  end

  def scheduled_appointments
    count = 0
    Appointment.all.each do |appointment|
      if appointment.status == "scheduled"
        count += 1
      end
    end
    count
  end

  def closed_appointments
    count = 0
    Appointment.all.each do |appointment|
      if appointment.status == "closed"
        count += 1
      end
    end
    count
  end

  def total_users
    User.all.count
  end

  def user_with_most_coins
    current_most = nil
    current_user = nil
    User.all.each do |user|
      if current_most == nil
        current_most = user.token_balance
      elsif user.token_balance > current_most
        current_most = user.token_balance
        current_user = user
      end
    end
    current_user
  end

  # User

  def walkee_closed_appointments
    appointments = []
    Appointment.all.each do |appointment|
      if current_user.id == appointment.dog.user.id && appointment.status == "complete"
        appointments << appointment
      end
    end
    appointments
  end

  def total_walkee_count
    count = 0
    walkee_closed_appointments.each do |appointment|
      count += 1
    end
    count
  end

  def walked_closed_appointments
    appointments = []
    Appointment.all.each do |appointment|
      if current_user.id == appointment.walker_id && appointment.status == "complete"
        appointments << appointment
      end
    end
    appointments
  end

  def total_walked_count
    count = 0
    walked_closed_appointments.each do |appointment|
      count += 1
    end
    count
  end

  def total_gained_coins
    tokens = 0
    walked_closed_appointments.each do |appointment|
      if appointment.tokens != nil
        tokens += appointment.tokens
      end
    end
    tokens
  end

  def total_spent_coins
    tokens = 0
    walkee_closed_appointments.each do |appointment|
      if appointment.tokens != nil
        tokens += appointment.tokens
      end
    end
    tokens
  end


end
