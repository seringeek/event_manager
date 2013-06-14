class EventsManagerController < ApplicationController
 #Filter to authenticate the user
 before_filter :authorize, only: [:event_profile]
  
  #Register form 
  def signup
      @user=User.new
  end
  
  #Registering a new user to the system
  def signup_create
      @user=User.new
      @user.name= params[:name]
      @user.email=params[:email]
      @user.password=params[:password]
      @user.gender=params[:gender]
      respond_to do |format|
        if @user.save
           format.html { redirect_to events_manager_index_path, notice: 'Login to continue.' }
        else
           format.html { render action: 'signup' }
           format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end  
  end
  
  #Listing all events in the home page
  def index
  	  @all_events=Event.find(:all, :order => "created_at DESC")
  end
  
  #Event profiles with users attending for the event
  def event_profile
   	  @event_details=Event.where(:id=>params[:event_id])
   	     if params[:attend]=='N'
   	        EventsUser.destroy_all(:user_id=>current_user.id,:event_id=>params[:event_id])
   	     end 
   	     if params[:attend]=='Y'
   	        EventsUser.create(:user_id=>current_user.id,:event_id=>params[:event_id])
   	     end 
   	  @event_participants=EventsUser.select(" users.id,users.name,users.gender").joins(",users").where("events_users.event_id=? AND events_users.user_id=users.id","#{params[:event_id]}")
         if current_user.gender=='F' 
   	        @discount_fee= @event_details[0].ticket_fee*(5.0/100)
   	        @ticket_fee =  @event_details[0].ticket_fee - @discount_fee
   	     else
   	        @ticket_fee= @event_details[0].ticket_fee
   	     end
   	  @event_participation=EventsUser.where(:event_id=>params[:event_id], :user_id=>current_user.id)
   	     if !@event_participation.blank?
   	         @attend_flag='A'
   	     else
   	         @attend_flag='NA'
   	     end
   	  @date_check=Date.parse(@event_details[0].event_date.to_s) >= Date.today
  end

end
