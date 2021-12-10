class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end
end
