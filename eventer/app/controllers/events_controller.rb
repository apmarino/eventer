class EventsController < ApplicationController
  def index
  	current_date = Date.today.to_s
  	puts current_date
  	@events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{current_date}&location=use_geoip&radius=&format=json&app_id=YOUR_APP_ID
")
	end

  def show

  end

end
