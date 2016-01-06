class Api::V1::UsersController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json

	def show
		respond_with User.find(params[:id])
	end

	def index
		@users = User.all
		render json:  { :flag => true, :user => @users }
		#respond_to do |format|
		#	format.json { render json: @users }
		#end
	end
	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user, status: 201, location: [:api, @user]
		else
			render json: { errors: @user.errors}, status: 422
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end

end