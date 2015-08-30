class UsersController < ApplicationController
	def index
		@users =User.all
	end

	def new
		@user =User.new
	end

	def create
		User.create(user_params)
		redirect_to events_path
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:user_name, :password_digest, :about_me, :avatar, :twitter)
	end
end