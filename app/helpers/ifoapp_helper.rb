module IfoappHelper
  def timeVolunteered(person)
    if person.time_out != nil
      ((person.time_out - person.time_in) / (60 * 60)).round(1) 
    end
  end
  
  def timeOut(person)
    if person.time_out != nil
      person.time_out.strftime("%I:%M%p")
    end
  end
end
