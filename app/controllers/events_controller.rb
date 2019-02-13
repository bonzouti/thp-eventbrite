class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
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
end
