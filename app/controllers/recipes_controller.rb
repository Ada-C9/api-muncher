require 'will_paginate/array'

class RecipesController < ApplicationController

  # around_action :catch_api_error

  def search; end

  def index
    @query = params[:query]
    @recipes = EdamamApiWrapper.search_results(@query).paginate(page: params[:page], per_page: 12)
  end

  def show
    id = params[:id]

    @recipe = EdamamApiWrapper.recipe_details(id)
  end

  private
  # def catch_api_error
  #   begin
  #     yield
  #   rescue Standard_Error
  #     flash[:status] = :failure
  #     flash[:message] = "API called failed"
  #     redirect_back fallback_location: root_path
  #   end
  # end
end
