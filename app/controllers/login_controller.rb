class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.find_by(:email => params[:user][:email]).try(:authenticate, params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path
  end
end
