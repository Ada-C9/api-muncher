class RecipesController < ApplicationController

def new
  @search_term = params[:search_term]
end

def create
  search_term = params[:search_term]
end

def index
end

def show
end



end
