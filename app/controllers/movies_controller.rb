class MoviesController < ApplicationController
  def index
    movies = Movie.order(title: :asc).includes(:genres)
    @pagy, @movies = pagy(movies)
  end

  def show
    @movie = Movie.friendly.find(params[:id])
  end
end
