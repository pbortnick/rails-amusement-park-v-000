class SessionsController < ApplicationController

  before_action :current_user, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(name_param)
    if @user.present? && @user.authenticate(password_param[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Name or password incorrect, try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def name_param
    params.require(:user).permit(:name)
  end

  def password_param
    params.require(:user).permit(:password)
  end

end
