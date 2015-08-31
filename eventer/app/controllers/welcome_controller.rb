class WelcomeController < ApplicationController

  def index
    if session[:user_id] != nil
		redirect_to "/events"
	end
    @user = User.new


  end

end
