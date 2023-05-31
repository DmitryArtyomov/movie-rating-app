class Genre < ApplicationRecord
  has_many :movie_genres, inverse_of: :genre, dependent: :destroy
  has_many :movies, through: :movie_genres

  validates :name, presence: true
end
