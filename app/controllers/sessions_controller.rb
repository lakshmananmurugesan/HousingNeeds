class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to articles_path,notice: "Logged In !"
    else
      flash.now.alert = "Email or Password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id]= nil
    redirect_to root_url,notice: "You are Logged Out !"
  end
end
