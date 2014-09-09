class UsersController < ApplicationController
  layout 'admin', only: [:index, :new, :edit]

  def index
    @users = User.all.order(:last_name).order(:first_name)
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
  end
end
