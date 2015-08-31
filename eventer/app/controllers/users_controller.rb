	class UsersController < ApplicationController
	def index
		@users =User.all
	end

	def new
		@user =User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to users_path
		# if @user.save
		# 	session[:user_id] = @user.id
		#  redirect_to users_path
		# else
		# 	flash[:error] = "You fucked up something"
		# 	redirect_to '/'
		# end
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:user_name, :password, :password_confirmation, :about_me, :avatar, :twitter)
	end
end