
class EventsController < ApplicationController

	def index
	  	current_date = Date.today.to_s
	  	
	  	@events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{current_date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID
	")
	  	@ip = request.remote_ip
	  	location = Geocoder.search(@ip)
	  	@long = location[0].longitude
	  	@lat = location[0].latitude
	  	puts "@long: " << "#{@long}"
      puts "@lat: " << "#{@lat}"
      puts "@ip: " << "#{@ip}"
      puts "request long: " << "#{request.location.longitude}"
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
    date = @single['datetime'].gsub!("T", " ")
    @the_date = DateTime.parse(date).strftime('%A %B %d, %I:%M %p %Y')
    event_search = Event.where({venue_name: @single['venue']['name']})
    
    if event_search.length > 0
      @see_users = event_search.users
    else 
      @see_users = []
    end
    
 		@event=Event.new
  end


  def create
  	event = Event.create(event_params)
  	EventsUser.create({event_id: event.id, user_id: session[:user_id]})
  	redirect_to events_path
  end

  def destroy
  	event =Event.find(params[:id])
  	event_user = EventsUser.find_by({event_id: params[:id]})
  	if event_user['user_id'] == session[:user_id]
  		event.destroy
  		redirect_to '/users/' + session[:user_id].to_s

  	else 
  		flash[:error] = "You do not have access"
		redirect_to '/users/' + session[:user_id].to_s
		end
	end


  private
  def event_params
  	params.require(:event).permit(:artist_name, :artist_image, :venue_name, :location, :date)
end
end
