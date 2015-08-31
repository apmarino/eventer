class EventsController < ApplicationController
  def index
  	current_date = Date.today.to_s
  	puts current_date
  	@events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{current_date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID
")
	end

  def show
  	event_id = params[:id]
  	city = params[:city]
  	region = params[:region]
  	@single  = HTTParty.get("http://api.bandsintown.com/events/search.json?location=#{city},#{region}&id=#{event_id}")
 		@event=Event.new
  end

  

  def create
  	Event.create(event_params)
  	redirect_to events_path
  end

  private
  def event_params
  	params.require(:event).permit(:artist_name, :artist_image, :venue_name, :location, :date)
end
end
