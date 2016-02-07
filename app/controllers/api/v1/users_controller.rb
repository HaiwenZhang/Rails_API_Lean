class Api::V1::UsersController < Api::V1::BaseController

  def show
    render json: User.find(params[:id]), status: 200
  end
end
