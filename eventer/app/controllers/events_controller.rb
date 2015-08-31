class EventsController < ApplicationController
  def index
  	current_date = Date.today.to_s
  	@events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{current_date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID")
	end

  def show
  	current_date = Date.today.to_s
  	event_id = params[:id]
  	city = params[:city]
  	region = params[:region]
  	@single
  	@all_events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{current_date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID")		
  	@all_events.each do |event|
  		if event['id'] == event_id.to_i

  			@single = event
  		end
  	end
 		@event=Event.new
  end


  def create
  	event = Event.create(event_params)
  	EventsUser.create({event_id: event.id, user_id: session[:user_id]})
  	redirect_to events_path

  end

  private
  def event_params
  	params.require(:event).permit(:artist_name, :artist_image, :venue_name, :location, :date)
end
end
