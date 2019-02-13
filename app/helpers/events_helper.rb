module EventsHelper
  def is_user_the_event_admin?
    user_signed_in? && current_user == @event.user
  end
end
