class MuncherController < ApplicationController


  def index
    @recipes = EdamamApiWrapper.list_recipes()
  end

  def show

  end

  def search

  end
end
