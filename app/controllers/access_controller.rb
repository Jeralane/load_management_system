class AccessController < ApplicationController
  before_action :confirm_logged_in, only: :index

  layout 'admin', only: :index

  def index
  end

  def login
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:admin] = nil
    flash[:notice] = "Logged out"
    redirect_to(action: 'login')
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
      if authorized_user
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.username
        session[:admin] = authorized_user.admin
        flash[:notice] = "You are now logged in."
        redirect_to(action: 'index')
      else
        flash[:notice] = "Invalid username/password combination."
        redirect_to(action: 'login')
      end
    end

  end
end
