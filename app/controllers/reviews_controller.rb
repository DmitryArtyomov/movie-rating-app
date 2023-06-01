class ReviewsController < ApplicationController
  before_action :find_review, except: :create

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save

    render_review_turbo_partial('show')
  end

  def edit
    render_review_turbo_partial('form')
  end

  def update
    @review.update(review_params)

    render_review_turbo_partial('show')
  end

  def destroy
    @review.destroy
    movie = @review.movie
    @review = Review.new(movie_id: movie.id)

    render_review_turbo_partial('form')
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :rating, :text)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def render_review_turbo_partial(partial)
    render turbo_stream: turbo_stream.replace(
      'user-review',
      partial: "reviews/#{partial}",
      locals: { review: @review }
    )
  end
end
