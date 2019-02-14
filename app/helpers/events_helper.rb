module EventsHelper
  def user_is_the_event_admin?
    user_signed_in? && current_user == @event.user
  end

  def user_is_not_attending_the_event?
    !user_signed_in?
  end
  
  def is_user_an_attendee?
    @array = []
    @event.attendances.each do |attendee|
      @array << attendee.user.id
    end
    if user_signed_in?
      @array.include?(current_user.id)
    end
  end
end
