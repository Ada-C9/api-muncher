class MuncherController < ApplicationController


  def index
    @recipes = EdamamApiWrapper.list_recipes('chicken')
  end

  def show
  end
end
