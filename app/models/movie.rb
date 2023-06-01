class Movie < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :movie_genres, inverse_of: :movie, dependent: :destroy
  has_many :genres, through: :movie_genres
  has_many :reviews, -> { order(id: :desc) }, inverse_of: :movie, dependent: :destroy

  validates :title, :director, :year, :genres, presence: true

  def slug_candidates
    [
      :title,
      [:title, :year],
      [:title, :year, :director]
    ]
  end

  def recalculate_rating!
    self.average_rating = reviews.average(:rating)
    save!
    broadcast_replace(target: "movie-full-rating", partial: 'movies/movie_full_rating')
    broadcast_replace_to('movies', target: "movie-#{id}-rating", partial: 'movies/movie_rating')
  end
end
