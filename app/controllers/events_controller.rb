class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  
  def index
    @events = Event.all
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(post_params)
      redirect_to @event
      flash[:success] = "Bravo"
    else
      render :edit
      flash[:danger] = "Raté"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @attendees_of_the_event = @event.attendances
    @attendees_of_the_event.each do |attendee|
      attendee.destroy
    end
    @event.destroy
    redirect_to events_path
    flash[:success] = "L'évènement a bien été supprimé !"
  end

  def create
    
    @event = Event.new(
      start_date: params[:start_date],
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      user_id: current_user.id)

    puts @event.errors

    if @event.save
      flash[:success] = "Ton évènement est sauvegardé !"
      redirect_to event_path(@event.id)
    else
      flash[:error] = "Ton évènement n'a pas pu être sauvé! Merde alors :("
      render :new
    end
  end

  private

  def post_params
    params.require(:event).permit(:title, :description, :price, :location, :duration, :start_date)
  end

end
