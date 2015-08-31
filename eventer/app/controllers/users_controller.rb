class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]

	def index
		@users =User.all
	end

	def new
		@user =User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
		 session[:user_id] = @user.id
		 redirect_to users_path
		else
		 flash[:error] = "You fucked up something"
		 redirect_to '/events'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:user_name, :password, :password_confirmation, :about_me, :twitter, :avatar)
	end
end