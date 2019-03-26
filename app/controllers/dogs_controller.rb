class DogsController < ApplicationController

  def new
    users
    @dog = Dog.new
  end

  def create
    users
    @dog = Dog.new(dog_params)
    if @dog.valid?
      @dog.save
      session[:dog_id] = @dog.id
      redirect_to @dog
    else
      render :new
    end
    # @dog = Dog.create(dog_params)
    #   if @dog.valid?
    #     redirect_to dog_path(@dog)
    #   else
    #     flash[:errors] = @dog.errors.full_messages
    #     render :new
    #   end
    end

  def show
    find_dog
    render :show
  end

  def edit
    users
    find_dog
    render :edit
  end

  def update
    users
    find_dog
    @dog.update(dog_params)
    if @dog.valid?
      redirect_to dog_pat(@dog)
    else
      flash[:errors] = @dog.errors.full_messages
    end
  end

  private

  def find_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :hypo_allergenic, :care_info, :user_id)
  end

  def users
    @users = User.all
  end



end
