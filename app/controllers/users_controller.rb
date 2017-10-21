class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(
    email: params[:user][:email],
    password: params[:user][:password],
    password_confirmation: params[:user][:password_confirmation]
    )

    if @user.save
      flash[:notice] = "New User saved"
      redirect_to root_url
    else
      flash[:alert] = "Please fix errors"
      render :new
    end

  end

end
