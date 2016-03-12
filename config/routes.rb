require 'api_constraints.rb'

Rails.application.routes.draw do

  #devise_for :users
  # Api definition

  resources :users, :only => [:show, :create, :update, :destroy] do
    resources :products, :only => [:create, :update]
  end
  resources :sessions, :only => [:create, :destroy]
  resources :products, :only => [:show, :index]
rail
end
