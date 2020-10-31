class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  helpers do 
    
    def logged_in?
      session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

  end 

end
