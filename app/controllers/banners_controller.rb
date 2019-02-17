class BannersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @event = Event.find(params[:event_id])
    @event.banner.attach(params[:banner])
    redirect_to @event
  end
end
