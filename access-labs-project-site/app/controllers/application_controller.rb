class ApplicationController < ActionController::Base

  def log_out!
    session[:user_id] = nil
  end

  
end
