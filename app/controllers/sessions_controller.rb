class SessionsController < ApplicationController
  def new
  end

  def create
    #je recupere l'utilisateur grace a son email
    user = User.find_by(email: params[:email])
    #je verifie que le mdp de lutilisateur est le meme que celui en base
    if params[:password] == user.password
      session[:user_id] = user.id
      redirect_to root_path
    end
  end
end