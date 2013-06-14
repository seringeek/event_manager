class SessionController < ApplicationController

 #Creating session for a authorized user
 def create
     user = User.find_by_name_and_password(params[:name], params[:password])
       if user
          session[:user_id] = user.id
          redirect_to events_manager_index_path, :notice => "Logged in!"
       else
          redirect_to events_manager_index_path, :notice => "Invalid email or password!"
       end
     
  end
  
  #Destroying a session
  def destroy
      session[:user_id] = nil
      redirect_to events_manager_index_path, :notice => "Logged out!"
  end

end
