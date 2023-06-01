class MoviesController < ApplicationController
  def index
    movies = Movie.order(title: :asc).includes(:genres)
    @pagy, @movies = pagy(movies)
  end

  def show
    @movie = Movie.friendly.includes(:genres, reviews: :user).find(params[:id])
    @current_user_review = Review.find_or_initialize_by(movie_id: @movie.id, user_id: current_user&.id)
  end
end
