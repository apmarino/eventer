
class EventsController < ApplicationController

	def index
	  	current_date = Date.today.to_s
	  	
	  	@events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{current_date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID
	")
	  	@ip = request.remote_ip
	  	# location = Geocoder.search(@ip)
	  	@long = request.location.longitude
	  	@lat = request.location.latitude
	  	# puts "@long: " << "#{@long}"
      #puts "@lat: " << "#{@lat}"
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
    event_search = Event.where({venue_name: @single['venue']['name'], date: @single['datetime']})
    
    if event_search.length > 0
      @see_users = event_search.map do |event|
        event.users
      end
    else 
      @see_users = []
    end
    
 		@event=Event.new
  end


  def create
    search = EventsUser.where(user_id: params["event"]["user_id"])
    gather = search.map do |s|
      double = Event.find_by(id: s["event_id"])
      double
    end
    duplicate = false
    gather.each do |s|
    if s["venue_name"] == params["event"]["venue_name"] && s["artist_name"] == params["event"]["artist_name"]
      duplicate = true
      end
    end
    if duplicate == true
      redirect_to events_path
    else      
    	event = Event.create(event_params)
    	EventsUser.create({event_id: event.id, user_id: session[:user_id]})
    	redirect_to events_path
    end
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
  	params.require(:event).permit(:artist_name, :artist_image, :venue_name, :location, :date, :lat, :long)
end
end
