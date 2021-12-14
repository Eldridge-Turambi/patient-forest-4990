class StudiosController < ApplicationController

  def index
    @studios = Studio.all
    #@movies = @studios.movies
  end
end
