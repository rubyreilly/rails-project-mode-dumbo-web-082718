class ApplicationController < ActionController::Base

  before_action :setup_site

  def index
    
  end

  private

  def authenticate!
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def authenticated?(user_id)
    current_user_id == user_id
  end

  def log_in_user(user_id)
    session[:user_id] = user_id
  end

  def logged_in?
     !!current_user_id
   end

   def current_user
   @current_user ||= User.find(current_user_id)
   @current_user
  end

  def log_out!
    session[:user_id] = nil
  end

  def current_user_id
    session[:user_id]
  end

  def setup_site
  if current_user_id
    @current_user = current_user
  end
  @message = flash.now[:message]
  @errors = flash.now[:errors]
end


end
