class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def show
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :address, :city, :state, :zip_code, :dob)
  end

end
