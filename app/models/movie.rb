class Movie < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :movie_genres, inverse_of: :movie, dependent: :destroy
  has_many :genres, through: :movie_genres

  validates :title, :director, :year, :genres, presence: true

  def slug_candidates
    [
      :title,
      [:title, :year],
      [:title, :year, :director]
    ]
  end
end
