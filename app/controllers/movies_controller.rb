class MoviesController < ApplicationController

  def new

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:id])
    Actor.create!(actor_params)
    redirect_to "/movies/#{@movie.id}"
  end

  private
    def actor_params
      params.permit(:name, :age)
    end
end
