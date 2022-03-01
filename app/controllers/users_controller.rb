class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params_user = params.require(:user).permit(:email, :password)
    @user = User.new(params_user)
    if @user.save!
      redirect_to root_path
    end
  end

  def show
    if current_user.nil?
      return redirect_to new_session_path
    end
    return redirect_to new_session_path if session[:id].nil?
    @user = User.find(session[:id])
  end
end