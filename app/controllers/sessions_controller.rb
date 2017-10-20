class SessionsController < ApplicationController

  def new
    #code
  end

  def create
    user = User.find_by( email: params[:email] )

    if user && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to pictures_url, notice: "Logged in!"
    else
      render :new, notice: "Fill in email and password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to pictures_url, notice: "Logged out!"
  end

end
