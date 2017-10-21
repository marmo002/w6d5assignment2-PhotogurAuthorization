class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_sessions_url
    end
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end

  def ensure_user_owns_picture
    picture_owner = @picture.user
    unless @picture.user_id == current_user.id
      flash[:notice] = "You are not #{picture_owner.email}"
      redirect_to new_sessions_url
    end
  end
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
