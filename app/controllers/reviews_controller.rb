class ReviewsController < ApplicationController

  # def index
  #   @reviews = Review.all
  # end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @users = users
  end

  def create
    byebug
    @review = Review.create(review_params)
    @review.update(walker_id: current_user.id)
    # byebug
    # if @review.valid?
    @review.save
    redirect_to "user_path(#{current_user.id})"
    # else
      # render :new
    # end
  end

  def edit
    #code
  end

  def update
    #code
  end

  def delete
    #code
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def appointments
    appointments = []
    Appointment.all.each do |appointment|
      if appointment.status == "complete"
        appointments << appointment
      end
    end
    appointments
  end

  def users
    users = []
    appointments.each do |appointment|
      users << appointment.dog.user
    end
    users
  end


end
