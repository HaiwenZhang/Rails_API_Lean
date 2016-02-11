require 'api_constraints.rb'

Rails.application.routes.draw do

  # devise_for :users
  # Api definition
  # namespace :api, defaults: { format: :json } do
  #  scope module: :v1,
  #        constraints: ApiConstraints.new(version: 1, defaults: true) do
  #    resources :users, :only => [:show]

  #  end
  # end

  resources :users, :only => [:show, :create, :update, :destroy]
end
