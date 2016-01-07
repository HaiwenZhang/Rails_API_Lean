class Api::V1::UsersController < ApplicationController
	#wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
	wrap_parameters :user, include: [:username, :email, :password, :password_confirmation]
	skip_before_filter  :verify_authenticity_token
	respond_to :json


	def show
		respond_with User.find(params[:id])
	end

	def index
		@users = User.all
		#render json:  { :flag => true, :user => @users }
    render json: @users
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

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render json: @user, status: 200, location: [:api, @user]
		else
			render json: { errors: @user.errors}, status: 422
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		head 204
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end

end
