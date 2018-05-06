require 'will_paginate/array'
require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe'


class RecipesController < ApplicationController
  def home; end


  def index

    @query= params[:query]
      results = EdamamApiWrapper.list_recipes(params[:query])
    if results.empty?
      redirect_to root_path
    else
      @recipes =  results.paginate(:page => params[:page], :per_page => 8)
      return @recipes

    end
  end

  def show
    @uri = params[:uri]
    @recipe = EdamamApiWrapper.get_recipe(@uri)
    unless @recipe
      head :not_found
    end
  end


end
