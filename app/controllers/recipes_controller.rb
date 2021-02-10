require 'will_paginate/array'
class RecipesController < ApplicationController
  around_action :catch_api_error

  def search ;end

  def index
    @recipes = EdemamApiWrapper.search_recipes(params[:query]).paginate(:page => params[:page], :per_page => 10)
  end

  # Show a found recipes details
  def show
    @recipe = EdemamApiWrapper.show_recipe(params[:uri])
  end

  private
  def catch_api_error
    begin
      # Controller Action I want to run up in here
      yield
      # Oh no, error occured in the app, SOS and rescue
    rescue EdemamApiWrapper::EdemamError => error
      flash[:status] = :failure
      flash[:message] = "Api called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end
end
