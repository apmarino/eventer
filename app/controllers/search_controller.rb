class SearchController < ApplicationController
	
	def index
		@date = params["date"]
	  	@ip = request.remote_ip
      @events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{@date}&location=#{@ip}&radius=&format=json&app_id=YOUR_APP_ID
  ")
  

	end


  def show
		date = params[:date]  	
		event_id = params[:id]
  	city = params[:city]
  	region = params[:region]
    @ip = request.remote_ip
  	@single
  	@all_events = HTTParty.get("http://api.bandsintown.com/events/search?date=#{date}&location=#{@ip}&radius=&format=json&app_id=YOUR_APP_ID")		
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


  
end