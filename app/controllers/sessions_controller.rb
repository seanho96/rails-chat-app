class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:username].downcase)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def signup
    user = User.new(username: params[:signup][:username].downcase,
                    password: params[:signup][:password])
    if user.save
      flash[:success] = "You are logged in successfully #{user.username}"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Something went wrong, make sure you filled all fields or username is already taken'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    return unless logged_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_path
  end
end
