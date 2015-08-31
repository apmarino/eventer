class SearchController < ApplicationController
	
	def index
		@date = params["date"]
	  	@events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{@date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID
	")
	  	@ip = request.remote_ip
	  	location = Geocoder.search(@ip)
	  	@long = location[0].longitude
	  	@lat = location[0].latitude

	end


  def show
		date = params[:date]  	
		event_id = params[:id]
  	city = params[:city]
  	region = params[:region]
  	@single
  	@all_events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID")		
  	@all_events.each do |event|
  		if event['id'] == event_id.to_i

  			@single = event
  		end
  	end
 		@event=Event.new
  end


  
end