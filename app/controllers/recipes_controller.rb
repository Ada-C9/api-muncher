require 'will_paginate/array'

class RecipesController < ApplicationController

  around_action :catch_api_error, only: [:index, :show]

  def search; end

  def index
    if params[:query] == ""
      flash[:status] = :failure
      flash[:message] = "You must enter something to search. Please try again."
      redirect_back fallback_location: root_path
    else
      @query = params[:query]
      @recipes = EdamamApiWrapper.search_results(@query).paginate(page: params[:page], per_page: 12)
    end
  end

  def show
    id = params[:id]
    @recipe = EdamamApiWrapper.recipe_details(id)
  end

  private
  def catch_api_error
    begin
      yield
    rescue EdamamApiWrapper::EdamamError
      flash[:status] = :failure
      flash[:message] = "API called failed. No results found."
      redirect_back fallback_location: root_path
    end
  end
end
