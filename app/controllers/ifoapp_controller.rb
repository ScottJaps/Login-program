class IfoappController < ApplicationController
  def index
  end
  
  def sign_in
  end
  
  def sign_out
    @the_volunteers = Volunteer.all
  end
  
  def create
    current_volunteer = Volunteer.create(params[:volunteer])
    flash[:notice] = "#{current_volunteer.name} was Successfully Signed In."
    redirect_to ifoapp_index_path
  end
  
end
