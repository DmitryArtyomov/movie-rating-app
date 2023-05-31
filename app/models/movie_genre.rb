class MovieGenre < ApplicationRecord
  belongs_to :movie, inverse_of: :movie_genres
  belongs_to :genre, inverse_of: :movie_genres

  validates :movie_id, uniqueness: { scope: :genre_id }
end
