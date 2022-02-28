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
    @user = User.find(params[:id])
  end
end