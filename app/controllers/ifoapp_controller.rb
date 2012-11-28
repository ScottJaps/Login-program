class IfoappController < ApplicationController
  #http_basic_authenticate_with :name => "starting_username", :password => "starting_password"
  #uncomment this and put in basic username/password if the computer running this is connected to the internet.
  def index
  end
  
  def sign_in
    t=Time.now
    if t.min >=52 && t.min <=55
      t = t + (8.minutes)
    elsif t.min >= 56
      t = t + (5.minutes)
    end
    #this prevents minutes from rounding to 60, needs to round to 0 and increment hour by 1, doing it manually will lead to problems right before midnight.
    minute = ((( t.min + 7.5 ) / 15).to_i * 15)%60
    @currentTime = Time.local(t.year, t.month, t.day, t.hour, minute)
    #this rounds the time to the nearest 15 minutes for the default option of the time_select
  end
  
  def sign_out
    @the_volunteers = Volunteer.where('time_in BETWEEN ? AND ? AND time_out IS NULL', DateTime.now.beginning_of_day, DateTime.now.end_of_day)  
    #finds people who have not logged out, but logged in today
  end
  
  def sign_person_out
    the_volunteer = Volunteer.find_by_id(params[:id])
    flash[:notice] = "Sign out successful."
    the_volunteer.update_attribute(:time_out, DateTime.now)  
    #signs person out at current time
    redirect_to ifoapp_index_path
  end
  
  def create
    @current_volunteer = Volunteer.create(params[:volunteer])
    if(@current_volunteer.errors.blank?)   #no errors
      flash[:notice] = "Sign in successful."    
    end
    flash[:notice] = @current_volunteer.errors.first.second if @current_volunteer.errors.any?
    #@current_volunteer.errors is a hash of all errors, the first one is the first error, of that error, the second part is the message part of the error (first part is the field that failed verification)
    redirect_to ifoapp_index_path
  end
  
  def viewall
    if params[:startdate] != nil
      @selected_startdate = DateTime.new(params[:startdate]["date(1i)"].to_i, params[:startdate]["date(2i)"].to_i, params[:startdate]["date(3i)"].to_i)
      session[:startdate] = @selected_startdate
    elsif session[:startdate] != nil
      @selected_startdate = session[:startdate]
    else
      @selected_startdate = DateTime.new(2012, 10, 1)
    end
    if params[:enddate] != nil
      @selected_enddate = DateTime.new(params[:enddate]["date(1i)"].to_i, params[:enddate]["date(2i)"].to_i, params[:enddate]["date(3i)"].to_i)
      session[:enddate] = @selected_enddate
    elsif session[:enddate] != nil
     @selected_enddate = session[:enddate]
    else 
      @selected_enddate = DateTime.now.end_of_day
    end
    #first checks to see if a end/start date are sent
    #if nothing is sent, checks session (since they may have run a sort)
    #lastly it will default to all entries for this option
    #these will be saved between requests in session in case a sort is run
    @the_volunteers = Volunteer.order(params[:sort]).where('time_in BETWEEN ? AND ?', @selected_startdate.beginning_of_day, @selected_enddate.end_of_day)
    #searches based off of date only and sorts
    if !params[:program].blank?     #a program was selected from the list
        @selected_program = params[:program]
        session[:program] = @selected_program
        @the_volunteers = @the_volunteers.where(:program => @selected_program)
    elsif params[:program] == ""      #the blank option was selected
      session[:program] = nil
    elsif session[:program] != nil    #a sort was run 
      @selected_program = session[:program]
      @the_volunteers = @the_volunteers.where(:program => @selected_program)
    end
    #this finds out if a program was given in params or session and searches if one was, the selection is saved in session in case a sort is run
    #if program was not selected, nothing should be run
    if !params[:name].blank?      #a name was entered
      @selected_name = params[:name]
      session[:name] = @selected_name
      @the_volunteers = @the_volunteers.where(:name => @selected_name)
    elsif params[:name] == "" #a blank field was entered
      session[:name] = ""
    elsif !session[:name].blank?   #a sort was run
      @selected_name = session[:name]
      @the_volunteers = @the_volunteers.where(:name => @selected_name)
    end
    #this finds out if a specific name was given in params or session and searches if one was, the selection is saved in session in case a sort is run
    #if no name was given, then nothing should be run
  end
  
  def staff_in
  end
  
  def staff_login
    if "the_pass" == params[:password]  #this is the password, it needs to be changed
      redirect_to :action => "viewall" and return
    else
      flash[:notice] = "wrong password"
    end
    redirect_to :action => "staff_in"
  end
  #this is a bad way to do passwords, but IN THIS CASE this computer should not be connected to anything and the password is to prevent people from accidently getting into something they should not be able to.
  def staff_logout
    reset_session
    redirect_to ifoapp_index_path
  end
  
  def edit
    @person = Volunteer.find params[:id]
  end
  
  def update
    @person = Volunteer.find params[:id]
    timeout = {"time_out(1i)"=> @person.time_in.year.to_s, "time_out(2i)"=>@person.time_in.month.to_s, "time_out(3i)"=>@person.time_in.day.to_s, "time_out(4i)"=>params[:volunteer]["time_out(4i)"], "time_out(5i)"=> params[:volunteer]["time_out(5i)"]}    
    @person.update_attributes(timeout)
    flash[:notice] = "#{@person.name} was successfully updated."
    redirect_to :action => "viewall"
  end
  
  def reset_viewall
    reset_session
    redirect_to :action => "viewall" 
  end
end
