class UsersController < ApplicationController
  layout 'admin', only: [:index, :new, :edit]

  def index
    @users = User.all.order(:last_name).order(:first_name)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created.'
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :username, :email, :password)
  end
end
