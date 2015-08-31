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

end