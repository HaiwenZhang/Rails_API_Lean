class Api::V1::BaseController < ApplicationController
  # For api, use :null_session instead
  protect_from_forgery with: :null_session

  # Response the json data
  respond_to :json
end
