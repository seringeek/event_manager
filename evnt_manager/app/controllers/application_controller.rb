class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
 
   
  private
  #Assigning session to current user variable 
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #For filtration of unauthorized users

      def authorize
      if current_user.nil?
          redirect_to events_manager_index_path, :notice => "Login to continue!"
          return false
      else
      end 
  end
end
